package com.ptithcm.intern_project.security.service;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class OtpService {
    static String CHARACTERS = "ABCDEFGHJKLMNPQRSTUVWXYZ0123456789";
    static int OTP_LENGTH = 6;
    static SecureRandom RANDOM = new SecureRandom();

    public static String randOTP() {
        StringBuilder otp = new StringBuilder(OTP_LENGTH);
        for (int i = 0; i < OTP_LENGTH; i++) {
            int index = RANDOM.nextInt(CHARACTERS.length());
            otp.append(CHARACTERS.charAt(index));
        }
        return otp.toString();
    }

    public static boolean isValidOtp(String otp) {
        return otp.length() == OTP_LENGTH && otp.chars().allMatch(c -> CHARACTERS.indexOf(c) > -1);
    }
}

