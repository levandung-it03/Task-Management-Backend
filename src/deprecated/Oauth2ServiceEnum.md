```java
package com.ptithcm.intern_project.common.enums;

public enum Oauth2ServiceEnum {
    GOOGLE,
    FACEBOOK,
    GITHUB,
    ;
    public static boolean exists(String name) {
        for (Oauth2ServiceEnum o : Oauth2ServiceEnum.values())
            if (o.toString().equals(name))
                return true;
        return false;
    }
}
```