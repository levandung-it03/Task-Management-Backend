package com.ptithcm.intern_project.service;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.common.enums.TokenClaimNames;
import com.ptithcm.intern_project.common.enums.TokenTypes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.dto.general.GeneralTokenClaims;
import com.ptithcm.intern_project.dto.general.TokenInfoDTO;
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

    public TokenInfoDTO generateToken(GeneralTokenClaims claims) {
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
                .claim(TokenClaimNames.TOKEN_TYPE.getStr(), claims.getTypeEnum().toString());

            var jwtHeader = new JWSHeader.Builder(JWSAlgorithm.HS512).type(JOSEObjectType.JWT).build();
            var jwsObject = new JWSObject(jwtHeader, jwtClaimsSetBuilder.build().toPayload());
            jwsObject.sign(new MACSigner(customKeySpec));   //--May throw JOSEException

            return TokenInfoDTO.builder().jti(tokenId).token(jwsObject.serialize()).build();
        } catch (JOSEException e) {
            throw new AppExc(ErrorCodes.INVALID_TOKEN);
        }
    }

    public JWTClaimsSet extractValidToken(String token) throws AppExc {
        try {
            var plainToken = token.contains("Bearer ") ? token.split("Bearer ")[1] : token;

            var signedJWT = SignedJWT.parse(plainToken);
            var isValidKeyBySpec = signedJWT.verify(new MACVerifier(customKeySpec));
            if (!isValidKeyBySpec)
                throw new AppExc(ErrorCodes.INVALID_TOKEN);

            return signedJWT.getJWTClaimsSet();
        } catch (JOSEException | ParseException e) {
            throw new AppExc(ErrorCodes.INVALID_TOKEN);
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
            case REFRESH -> REFRESH_TIME;
            case ACCESS -> ACCESS_TIME;
            default -> 0;
        };
    }
}
