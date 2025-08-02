package com.ptithcm.intern_project.common.filter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jwt.JWTClaimsSet;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.enums.TokenClaimNames;
import com.ptithcm.intern_project.common.enums.TokenTypes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.jpa.model.Account;
import com.ptithcm.intern_project.redis.crud.InvalidTokenCrud;
import com.ptithcm.intern_project.redis.crud.RefreshTokenCrud;
import com.ptithcm.intern_project.service.JwtService;
import jakarta.servlet.DispatcherType;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AccessLevel;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;

@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class JWTAuthFilter extends OncePerRequestFilter {
    public final String[] byPassedPrefix = {
        "/public/",
        "/test/",
        "/swagger-ui/",
        "/v3/api-docs/",
        "/swagger-ui.html"
    };
    JwtService jwtService;
    RefreshTokenCrud refreshTokenCrud;
    InvalidTokenCrud invalidTokenCrud;
    ObjectMapper objectMapper;

    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request,
                                    @NonNull HttpServletResponse response,
                                    @NonNull FilterChain filterChain)
        throws ServletException, IOException, AppExc {
        try {
            if (isBypassToken(request)) {
                filterChain.doFilter(request, response);
                return;
            }
            final String token = request.getHeader("Authorization");
            if (token == null || !token.startsWith("Bearer "))
                throw new AppExc(ErrorCodes.INVALID_TOKEN);

            var jwtClaimsSet = jwtService.verifyTokenOrElseThrow(token, true);
            switch (TokenTypes.valueOf(jwtClaimsSet.getClaim(TokenClaimNames.TOKEN_TYPE.getStr()).toString())) {
                case ACCESS, OAUTH2_ACCESS:
                    var isKilledToken = invalidTokenCrud.existsById(jwtClaimsSet.getJWTID());
                    if (isKilledToken)  throw new AppExc(ErrorCodes.INVALID_TOKEN);

                    if (this.isExpiredToken(jwtClaimsSet))
                        throw new AppExc(ErrorCodes.EXPIRED_TOKEN);

                    break;
                case REFRESH, OAUTH2_REFRESH:
                    var isNotRequestWithRefTok = !request.getRequestURI().contains("/auth/private/");
                    if (isNotRequestWithRefTok) throw new AppExc(ErrorCodes.INVALID_TOKEN);

                    var isNotLoggedInSession = !refreshTokenCrud.existsById(jwtClaimsSet.getJWTID());
                    if (isNotLoggedInSession)   throw new AppExc(ErrorCodes.EXPIRED_SESSION);

                    if (this.isExpiredToken(jwtClaimsSet))
                        throw new AppExc(ErrorCodes.EXPIRED_SESSION);

                    break;
                default:
                    throw new AppExc(ErrorCodes.INVALID_TOKEN);
            }
            this.registerSecurityContext(request, jwtClaimsSet);
            filterChain.doFilter(request, response);
        } catch (AppExc e) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            this.catchFilterException(response, e);
        } catch (RuntimeException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            this.catchFilterException(response, new AppExc(ErrorCodes.UNAWARE_ERROR));
        }
    }

    private void registerSecurityContext(HttpServletRequest request, JWTClaimsSet jwtClaimsSet) {
        var authoritiesProvider = new UsernamePasswordAuthenticationToken(
            jwtClaimsSet.getSubject(), null,
            Account.extractAuthorities(jwtClaimsSet.getClaim(TokenClaimNames.SCOPES.getStr()).toString()));

        authoritiesProvider.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authoritiesProvider);
    }

    private boolean isExpiredToken(JWTClaimsSet jwtClaimsSet) {
        return new Date().after(jwtClaimsSet.getExpirationTime());
    }

    private boolean isBypassToken(HttpServletRequest request) {
        return request.getDispatcherType() == DispatcherType.FORWARD
            || Arrays.stream(byPassedPrefix).anyMatch(pref -> request.getRequestURI().contains(pref));
    }

    private void catchFilterException(HttpServletResponse response, AppExc e) throws IOException {
        var errorEnum = e.getErrorEnum();
        response.setContentType("application/json;charset=UTF-8");
        var writer = response.getWriter();
        var json = objectMapper.writeValueAsString(RestApiResponse.builder()
            .status(errorEnum.getStatus().value())
            .code(errorEnum.getCode())
            .body(null)
            .msg(errorEnum.getMsg())
            .time(LocalDateTime.now(ZoneId.systemDefault()))
            .build());
        writer.write(json);
        writer.flush();
    }
}
