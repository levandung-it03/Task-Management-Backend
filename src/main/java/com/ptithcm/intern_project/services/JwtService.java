package com.ptithcm.intern_project.services;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.enums.TokenClaimNames;
import com.ptithcm.intern_project.common.enums.TokenTypes;
import com.ptithcm.intern_project.common.exception.ApplicationException;
import com.ptithcm.intern_project.common.wrappers.GeneralTokenClaims;
import com.ptithcm.intern_project.common.wrappers.TokenInfo;
import lombok.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.spec.SecretKeySpec;
import java.text.ParseException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
public class JwtService {
    @Value("${spring.jackson.time-zone}")
    private String DATETIME_ZONE;
    @Value("${env.jwt.access-time}")
    private int ACCESS_TIME;
    @Value("${env.jwt.refresh-time}")
    private int REFRESH_TIME;
    @Value("${spring.application.name}")
    private String ISSUER;
    private final SecretKeySpec customKeySpec;

    public TokenInfo generateToken(GeneralTokenClaims claims) {
        try {
            var nowInstant = ZonedDateTime.now(ZoneId.of(DATETIME_ZONE)).toInstant();
            var tokenId = UUID.randomUUID().toString();
            var jwtClaimsSetBuilder = new JWTClaimsSet.Builder()
                .jwtID(tokenId)
                .issuer(ISSUER)
                .subject(claims.getSubject())
                .issueTime(Date.from(nowInstant))
                .expirationTime(Date.from(nowInstant.plusSeconds(this.getExpirationByTokenTypes(claims.getTypeEnum()))))
                .claim(TokenClaimNames.OWNER.getStr(), claims.getOwner())
                .claim(TokenClaimNames.SCOPES.getStr(), claims.getScopes())
                .claim(TokenClaimNames.TOKEN_TYPE.getStr(), claims.getTypeEnum().toString())
                .claim(TokenClaimNames.IS_OAUTH2.getStr(), claims.getIsOauth2().toString());

            var jwtHeader = new JWSHeader.Builder(JWSAlgorithm.HS512).type(JOSEObjectType.JWT).build();
            var jwsObject = new JWSObject(jwtHeader, jwtClaimsSetBuilder.build().toPayload());
            jwsObject.sign(new MACSigner(customKeySpec));   //--May throw JOSEException

            return TokenInfo.builder().jti(tokenId).token(jwsObject.serialize()).build();
        } catch (JOSEException e) {
            throw new ApplicationException(ErrorCodes.INVALID_TOKEN);
        }
    }

    public JWTClaimsSet verifyTokenOrElseThrow(String token, boolean isIgnoreExpiry) throws ApplicationException {
        try {
            //--Handle token Bearer type or not.
            var plainToken = token.contains("Bearer ") ? token.split("Bearer ")[1] : token;
            //--Prepare components to parse and verify token.
            var signedJWT = SignedJWT.parse(plainToken);
            var macVerifier = new MACVerifier(customKeySpec);
            //--Verify with built Secret Key Spec.
            if (!signedJWT.verify(macVerifier))
                throw new ApplicationException(ErrorCodes.INVALID_TOKEN);
            //--Parse token to proactively check expiry time.
            var jwtClaimsSet = signedJWT.getJWTClaimsSet();
            if (new Date().after(jwtClaimsSet.getExpirationTime())) {
                if (isIgnoreExpiry)    return jwtClaimsSet;    //--Return claimsSet to work with.
                throw new ApplicationException(ErrorCodes.EXPIRED_TOKEN);   //--Throw error to client to login again.
            }
            return jwtClaimsSet;    //--Return claimsSet to work with.
        } catch (JOSEException | ParseException e) {
            throw new ApplicationException(ErrorCodes.INVALID_TOKEN);
        }
    }

    public HashMap<String, String> readPayload(String token) {
        var payload = token.split("\\.")[1];
        int paddingLength = 4 - payload.length() % 4;
        if (paddingLength < 4)    //--Required format if (payload.length % 4) # 0
            payload += "=".repeat(paddingLength);
        var payLoadJson = new String(Base64.getUrlDecoder().decode(payload));
         var strItems = payLoadJson.replaceAll("[{}]", "").split(",");
        var result = new HashMap<String, String>();
        Arrays.stream(strItems).forEach(strItem -> {
            var items = strItem.replaceAll("[\"]", "").split(":");
            result.put(items[0], items[1]);
        });
        return result;
    }

    private int getExpirationByTokenTypes(TokenTypes type) {
        return switch (type) {
            case REFRESH, OAUTH2_REFRESH -> REFRESH_TIME;
            case ACCESS, OAUTH2_ACCESS -> ACCESS_TIME;
            default -> 0;
        };
    }
}
