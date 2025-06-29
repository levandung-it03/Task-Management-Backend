```java
    @ResponseBody
    @GetMapping("/public/auth/account/v1/get-oauth2-authorizer")
    public ResponseEntity<ApiResponseObject<Map<String, String>>> getOauth2Authorizer(
        @Valid DTO_GetOauth2Authorizer dto) {
        return ApiResponseObject.fromScs(AUTHENTICATE, accountService.getOauth2Authorizer(dto.getOauth2Service()));
    }

    @ResponseBody
    @PostMapping("/public/auth/account/v1/oauth2-authenticate")
    public ResponseEntity<ApiResponseObject<DTO_AuthResponse>> oauth2Authenticate(
        @Valid @RequestBody DTO_Oauth2Authenticate dto) {
        return ApiResponseObject.fromScs(REGISTER, accountService.oauth2Authenticate(dto));
    }
```