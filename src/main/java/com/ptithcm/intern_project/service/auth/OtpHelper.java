package com.ptithcm.intern_project.service.auth;

import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class OtpHelper {
    static String UPPER_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    static String FULL_CHARACTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    static int OTP_LENGTH = 6;
    static SecureRandom RANDOM = new SecureRandom();

    public static String randCharacters(int length) {
        StringBuilder otp = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = RANDOM.nextInt(FULL_CHARACTERS.length());
            otp.append(FULL_CHARACTERS.charAt(index));
        }
        return otp.toString();
    }

    public static String randOTP(int length) {
        StringBuilder otp = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = RANDOM.nextInt(UPPER_CHARACTERS.length());
            otp.append(UPPER_CHARACTERS.charAt(index));
        }
        return otp.toString();
    }


    public static String randOTP() {
        return randOTP(OTP_LENGTH);
    }

    public static boolean isValidOtp(String otp) {
        return otp.length() == OTP_LENGTH && otp.chars().allMatch(c -> UPPER_CHARACTERS.indexOf(c) > -1);
    }
}

