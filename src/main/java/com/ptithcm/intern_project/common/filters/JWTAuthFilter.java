package com.ptithcm.intern_project.common.filters;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.enums.TokenClaimNames;
import com.ptithcm.intern_project.common.enums.TokenTypes;
import com.ptithcm.intern_project.common.exception.ApplicationException;
import com.ptithcm.intern_project.common.wrappers.ApiResponseObject;
import com.ptithcm.intern_project.data_jpa.entities.Account;
import com.ptithcm.intern_project.redis.redis_cruds.InvalidTokenCrud;
import com.ptithcm.intern_project.redis.redis_cruds.RefreshTokenCrud;
import com.ptithcm.intern_project.services.JwtService;
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
        "/api/public/",
        "/api/test/",
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
        throws ServletException, IOException, ApplicationException {
        try {
            if (isBypassToken(request)) {
                filterChain.doFilter(request, response);
                return;
            }
            final String token = request.getHeader("Authorization");
            if (token == null || !token.startsWith("Bearer ")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                throw new ApplicationException(ErrorCodes.INVALID_TOKEN);
            }
            var jwtClaimSet = jwtService.verifyTokenOrElseThrow(token, true);
            switch (TokenTypes.valueOf(jwtClaimSet.getClaim(TokenClaimNames.TOKEN_TYPE.getStr()).toString())) {
                case ACCESS, OAUTH2_ACCESS:
                    if (invalidTokenCrud.existsById(jwtClaimSet.getJWTID())) {
                        throw new ApplicationException(ErrorCodes.INVALID_TOKEN);
                    }
                    if (new Date().after(jwtClaimSet.getExpirationTime())) {
                        throw new ApplicationException(ErrorCodes.EXPIRED_TOKEN);
                    }
                    break;
                case REFRESH, OAUTH2_REFRESH:
                    if (!request.getRequestURI().contains("/auth/private/")) {
                        throw new ApplicationException(ErrorCodes.INVALID_TOKEN);
                    }
                    if (!refreshTokenCrud.existsById(jwtClaimSet.getJWTID())) {
                        throw new ApplicationException(ErrorCodes.EXPIRED_SESSION);
                    }
                    if (new Date().after(jwtClaimSet.getExpirationTime())) {
                        throw new ApplicationException(ErrorCodes.EXPIRED_SESSION);
                    }
                    break;
                default:
                    throw new ApplicationException(ErrorCodes.INVALID_TOKEN);
            }
            var authoritiesProvider = new UsernamePasswordAuthenticationToken(
                jwtClaimSet.getSubject(), null,
                Account.extractAuthorities(jwtClaimSet.getClaim(TokenClaimNames.SCOPES.getStr()).toString()));
            authoritiesProvider.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authoritiesProvider);
            filterChain.doFilter(request, response);
        } catch (ApplicationException e) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            this.catchFilterException(response, e);
        } catch (RuntimeException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            this.catchFilterException(response, new ApplicationException(ErrorCodes.UNAWARE_ERROR));
        }
    }

    private boolean isBypassToken(HttpServletRequest request) {
        return request.getDispatcherType() == DispatcherType.FORWARD
            || Arrays.stream(byPassedPrefix).anyMatch(pref -> request.getRequestURI().contains(pref));
    }

    private void catchFilterException(HttpServletResponse response, ApplicationException e) throws IOException {
        var errorEnum = e.getErrorEnum();
        response.setContentType("application/json;charset=UTF-8");
        var writer = response.getWriter();
        var json = objectMapper.writeValueAsString(ApiResponseObject.builder()
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
