```java
    @ResponseBody
    @GetMapping("/v1/get-gender-enums")
    public ResponseEntity<ApiResponseObject<HashMap<String, String>>> getGenderEnums() {
        var response = new HashMap<String, String>();
        for (UserInfo.Gender g: UserInfo.Gender.values())
            response.put(g.toString().charAt(0) + g.toString().substring(1).toLowerCase(), g.toString());
        return ApiResponseObject.fromScs(SuccessCodes.GET_ENUMS, response);
    }

    @ResponseBody
    @GetMapping("/v1/get-oauth2-service-enums")
    public ResponseEntity<ApiResponseObject<HashMap<String, String>>> getOauth2ServiceEnums() {
        var response = new HashMap<String, String>();
        for (Oauth2ServiceEnum o: Oauth2ServiceEnum.values())
            response.put(o.toString().toLowerCase(), o.toString());
        return ApiResponseObject.fromScs(SuccessCodes.GET_ENUMS, response);
    }
```