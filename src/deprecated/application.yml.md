```yaml
spring:
  security:
    oauth2:
      client:
        registration:
          google:
            client-name: Google
            client-id: "642475872375-v0vgnis6tijp1719n9n4ae42kdivd9an.apps.googleusercontent.com"
            client-secret: "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"
            scope: openid, email, profile, https://www.googleapis.com/auth/user.gender.read, https://www.googleapis.com/auth/user.birthday.read
            authorization-grant-type: authorization_code
            redirect-uri: "/auth/google/callback"
          github:
            client-name: GitHub
            client-id: "Ov23liav8JWBXBTJbfsE"
            client-secret: "1577f4856eb8fc9e9c7c24df5b9520ad5d8e8bd6"
            scope: read:user user:email
            authorization-grant-type: authorization_code
            redirect-uri: "/auth/github/callback"
        provider:
          google:
            authorization-uri: "https://accounts.google.com/o/oauth2/v2/auth"
            token-uri: "https://oauth2.googleapis.com/token"
            user-info-uri: "https://people.googleapis.com/v1/people/me"
            user-name-attribute: sub
          github:
            authorization-uri: "https://github.com/login/oauth/authorize"
            token-uri: "https://github.com/login/oauth/access_token"
            user-info-uri: "https://api.github.com/user"
            user-name-attribute: login
```