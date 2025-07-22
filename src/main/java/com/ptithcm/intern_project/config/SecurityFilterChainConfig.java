package com.ptithcm.intern_project.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.filter.JWTAuthFilter;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@EnableWebSecurity
@Configuration
@RequiredArgsConstructor
public class SecurityFilterChainConfig {
    @Value("${env.services.front-end}")
    private String frontendAddress;
    @Value("${env.services.gateway}")
    private String gatewayAddress;
    private final ObjectMapper objectMapper;
    private final JWTAuthFilter jwtAuthFilter;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
            .cors(cors -> cors.configurationSource(this.configurationSource()))
            .csrf(AbstractHttpConfigurer::disable)
            .sessionManagement(s -> s.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            .authorizeHttpRequests(request -> request
                .requestMatchers("/api/private/admin/**").hasAuthority("ROLE_ADMIN")
                .requestMatchers("/api/private/pm/**").hasAuthority("ROLE_PM")
                .requestMatchers("/api/private/lead/**").hasAuthority("ROLE_LEAD")
                .requestMatchers("/api/private/emp/**").hasAuthority("ROLE_EMP")
                .requestMatchers("/api/private/auth/**")
                .hasAnyAuthority("ROLE_ADMIN", "ROLE_PM", "ROLE_LEAD", "ROLE_EMP")
                .requestMatchers("/api/public/**").permitAll()
                .requestMatchers("/api/test/**").permitAll()
                .requestMatchers("/swagger-ui/**", "/v3/api-docs/**", "/swagger-ui.html").permitAll()
                .anyRequest().denyAll()
            ).exceptionHandling(exception -> exception.accessDeniedHandler(accessDeniedHandler()))  //--Role's denied.
            //--UsernamePasswordAuthenticationFilter is the first filter in SecurityFilterChain Collection
            //--So we add JwtFilter (customized) before it to work, and set SecurityContext to pass next default-filters.
            .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);
        return httpSecurity.build();
    }

    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
        return (httpServletRequest, httpServletResponse, accessDeniedException) -> {
            int httpStatus = ErrorCodes.FORBIDDEN_USER.getStatus().value();
            var responseObject = RestApiResponse.fromErr(ErrorCodes.FORBIDDEN_USER);
            var jsonResponse = objectMapper.writeValueAsString(responseObject);
            httpServletResponse.getWriter().write(jsonResponse);
            httpServletResponse.setStatus(httpStatus);
            httpServletResponse.setContentType(MediaType.APPLICATION_JSON_VALUE);
            httpServletResponse.getWriter().flush();
        };
    }

    @Bean
    public CorsConfigurationSource configurationSource() {
        var config = new CorsConfiguration();
        config.setAllowedOrigins(List.of(
            frontendAddress,
            gatewayAddress
        ));
        config.setAllowedMethods(List.of("POST", "OPTIONS", "GET", "DELETE", "PUT"));
        config.setAllowedHeaders(List.of("X-Requested-With", "Origin", "Content-Type", "Accept", "Authorization"));
        config.setAllowCredentials(true);   //--'allowedOrigins' can not be '*' if this field is 'true'.
        var source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }

}
