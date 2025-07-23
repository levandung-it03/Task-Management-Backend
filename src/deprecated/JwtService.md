```java

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
            throw new AppExc(ErrorCodes.INVALID_TOKEN);
        }
    }

    private int getExpirationByTokenTypes(TokenTypes type) {
        return switch (type) {
            case REFRESH, OAUTH2_REFRESH -> REFRESH_TIME;
            case ACCESS, OAUTH2_ACCESS -> ACCESS_TIME;
            default -> 0;
        };
    }
```