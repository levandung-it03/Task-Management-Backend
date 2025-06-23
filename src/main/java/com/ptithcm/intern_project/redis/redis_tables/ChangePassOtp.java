package com.ptithcm.intern_project.redis.redis_tables;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@RedisHash(value = "ChangePassOtp", timeToLive = 300)
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ChangePassOtp {
    public static int OTP_AGE = 300;
    @Id
    String email;
    String otp;
}
