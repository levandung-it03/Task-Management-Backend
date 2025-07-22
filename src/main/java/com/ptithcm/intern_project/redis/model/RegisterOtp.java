package com.ptithcm.intern_project.redis.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@RedisHash(value = "RegisterOtp", timeToLive = 300)
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RegisterOtp {
    public static int OTP_AGE = 300;
    @Id
    String email;
    String otp;
}
