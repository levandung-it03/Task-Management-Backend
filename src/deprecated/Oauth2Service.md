```java
package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.AuthorityEnum;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.enums.Oauth2ServiceEnum;
import com.ptithcm.intern_project.common.exception.ApplicationException;
import com.ptithcm.intern_project.dto.request.DTO_Oauth2Authenticate;
import com.ptithcm.intern_project.dto.response.DTO_Oauth2GoogleUserResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class Oauth2Service {
    @Value("${env.services.front-end}")
    private String FRONTEND_DOMAIN;

    @Value("${spring.security.oauth2.client.registration.google.redirect-uri}")
    private String GOOGLE_OAUTH2_REDIRECT;
    @Value("${spring.security.oauth2.client.provider.google.authorization-uri}")
    private String GOOGLE_OAUTH2_URL;
    @Value("${spring.security.oauth2.client.registration.google.client-secret}")
    private String GOOGLE_OAUTH2_SECRET;
    @Value("${spring.security.oauth2.client.registration.google.client-id}")
    private String GOOGLE_OAUTH2_CLI_ID;
    @Value("${spring.security.oauth2.client.registration.google.scope}")
    private Set<String> GOOGLE_OAUTH2_SCOPES;
    @Value("${spring.security.oauth2.client.registration.google.authorization-grant-type}")
    private String GOOGLE_OAUTH2_GRANT_TYPE;
    @Value("${spring.security.oauth2.client.provider.google.token-uri}")
    private String GOOGLE_OAUTH2_TOKEN_URI;
    @Value("${spring.security.oauth2.client.provider.google.user-info-uri}")
    private String GOOGLE_OAUTH2_GET_USER_INFO_URI;

    @Value("${spring.security.oauth2.client.registration.github.redirect-uri}")
    private String GITHUB_OAUTH2_REDIRECT;
    @Value("${spring.security.oauth2.client.provider.github.authorization-uri}")
    private String GITHUB_OAUTH2_URL;
    @Value("${spring.security.oauth2.client.registration.github.client-secret}")
    private String GITHUB_OAUTH2_SECRET;
    @Value("${spring.security.oauth2.client.registration.github.client-id}")
    private String GITHUB_OAUTH2_CLI_ID;
    @Value("${spring.security.oauth2.client.registration.github.scope}")
    private Set<String> GITHUB_OAUTH2_SCOPES;
    @Value("${spring.security.oauth2.client.registration.github.authorization-grant-type}")
    private String GITHUB_OAUTH2_GRANT_TYPE;
    @Value("${spring.security.oauth2.client.provider.github.token-uri}")
    private String GITHUB_OAUTH2_TOKEN_URI;
    @Value("${spring.security.oauth2.client.provider.github.user-info-uri}")
    private String GITHUB_OAUTH2_GET_USER_INFO_URI;

    private final WebClient webClient;

    public String getOauth2Authorizer(Oauth2ServiceEnum oauth2Enum) {
        StringBuilder authorizer;
        switch (oauth2Enum) {
            case Oauth2ServiceEnum.GOOGLE:
                authorizer = new StringBuilder(GOOGLE_OAUTH2_URL);
                authorizer.append("?client_id=").append(GOOGLE_OAUTH2_CLI_ID);
                authorizer.append("&redirect_uri=").append(FRONTEND_DOMAIN).append(GOOGLE_OAUTH2_REDIRECT);
                authorizer.append("&response_type=code");
                authorizer.append("&scope=").append(String.join("%20", GOOGLE_OAUTH2_SCOPES));
                authorizer.append("&access_type=offline");
                authorizer.append("&prompt=consent%20select_account");
                break;
            case Oauth2ServiceEnum.GITHUB:
                authorizer = new StringBuilder(GITHUB_OAUTH2_URL);
                authorizer.append("?client_id=").append(GITHUB_OAUTH2_CLI_ID);
                authorizer.append("&redirect_uri=").append(FRONTEND_DOMAIN).append(GITHUB_OAUTH2_REDIRECT);
                authorizer.append("&response_type=code");
                authorizer.append("&scope=").append(String.join("%20", GITHUB_OAUTH2_SCOPES));
                break;
            default:
                throw new ApplicationException(ErrorCodes.UNAWARE_ERROR);
        }
        return authorizer.toString();
    }

    public Map<String, Object> authenticateUser(DTO_Oauth2Authenticate dto) {
        Map<String, Object> oauth2UserInfo = new HashMap<>();
        switch (Oauth2ServiceEnum.valueOf(dto.getOauth2Service())) {
            case Oauth2ServiceEnum.GOOGLE: {
                String accessToken = this.getAccessToken(
                    GOOGLE_OAUTH2_TOKEN_URI,
                    GOOGLE_OAUTH2_CLI_ID,
                    GOOGLE_OAUTH2_SECRET,
                    GOOGLE_OAUTH2_REDIRECT,
                    GOOGLE_OAUTH2_GRANT_TYPE,
                    dto.getCode()
                );
                DTO_Oauth2GoogleUserResponse userInfoResponse = webClient.get()
                    .uri(GOOGLE_OAUTH2_GET_USER_INFO_URI + "?personFields=genders,birthdays,names,emailAddresses")
                    .header(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE)
                    .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
                    .retrieve()    //--Synchronize this method to main Thread by "block()"
                    .bodyToMono(DTO_Oauth2GoogleUserResponse.class)
                    .block();

                if (Objects.isNull(userInfoResponse)
                    || Objects.isNull(userInfoResponse.getEmailAddresses())
                    || Objects.isNull(userInfoResponse.getNames())) {
                    throw new ApplicationException(ErrorCodes.OAUTH2_PERMISSION);
                }
                if (Objects.nonNull(userInfoResponse.getBirthdays())) {
                    Map<String, Integer> birthdaysMap = (Map) userInfoResponse.getBirthdays().getLast().get("date");
                    oauth2UserInfo.put("dob",
                        LocalDate.of(birthdaysMap.get("year"), birthdaysMap.get("month"), birthdaysMap.get("day")));
                }
                if (Objects.nonNull(userInfoResponse.getGenders())) {
                    oauth2UserInfo.put("gender",
                        userInfoResponse.getGenders().getFirst().get("value").toString().toUpperCase());
                }
                oauth2UserInfo.put("sub", userInfoResponse.getEmailAddresses().getFirst().get("value"));
                oauth2UserInfo.put("owner", userInfoResponse.getNames().getFirst().get("displayName"));
                oauth2UserInfo.put("scopes", AuthorityEnum.ROLE_USER);
                oauth2UserInfo.put("oauth2Service", Oauth2ServiceEnum.GOOGLE);
                break;
            }
            case Oauth2ServiceEnum.GITHUB: {
                String accessToken = this.getAccessToken(
                    GITHUB_OAUTH2_TOKEN_URI,
                    GITHUB_OAUTH2_CLI_ID,
                    GITHUB_OAUTH2_SECRET,
                    GITHUB_OAUTH2_REDIRECT,
                    GITHUB_OAUTH2_GRANT_TYPE,
                    dto.getCode()
                );
                Map<String, Object> userInfoResponse = webClient.get()
                    .uri(GITHUB_OAUTH2_GET_USER_INFO_URI)
                    .header(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE)
                    .header(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken)
                    .retrieve()    //--Synchronize this method to main Thread by "block()"
                    .bodyToMono(new ParameterizedTypeReference<Map<String, Object>>() {
                    })
                    .block();
                if (Objects.isNull(userInfoResponse)
                    || Objects.isNull(userInfoResponse.get("login"))
                    || Objects.isNull(userInfoResponse.get("name"))) {
                    throw new ApplicationException(ErrorCodes.OAUTH2_PERMISSION);
                }
                oauth2UserInfo.put("sub", userInfoResponse.get("login"));
                oauth2UserInfo.put("owner", userInfoResponse.get("name"));
                oauth2UserInfo.put("scopes", AuthorityEnum.ROLE_USER);
                oauth2UserInfo.put("oauth2Service", Oauth2ServiceEnum.GITHUB);
                break;
            }
            default:
                throw new ApplicationException(ErrorCodes.UNAWARE_ERROR);
        }
        return oauth2UserInfo;
    }

    private String getAccessToken(String uri, String clientId, String secret, String redirect, String grant, String code) {
        Map<String, Object> getTokenResponse = webClient.post().uri(uri)
            .header(HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE)
            .body(BodyInserters.fromFormData("client_id", clientId)
                .with("client_secret", secret)
                .with("redirect_uri", FRONTEND_DOMAIN + redirect)
                .with("grant_type", grant)
                .with("code", URLDecoder.decode(code, StandardCharsets.UTF_8))
            ).retrieve()    //--Synchronize this method to main Thread by "block()"
            .bodyToMono(new ParameterizedTypeReference<Map<String, Object>>() {
            }).block();

        if (Objects.isNull(getTokenResponse)
            || Objects.isNull(getTokenResponse.get("access_token"))
            || getTokenResponse.get("access_token").toString().isBlank())
            throw new ApplicationException(ErrorCodes.INVALID_TOKEN);

        return getTokenResponse.get("access_token").toString();
    }
}
```