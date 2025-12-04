package com.ptithcm.intern_project.service.auth;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

@Service
public class CryptoService {
    @Value("${env.crypto.transformation}")
    String TRANSFORMATION;
    @Value("${env.crypto.algorithm}")
    String ALGORITHM;

    public String encrypt(Object plainText, String secret) throws Exception {
        Cipher cipher = this.initCipher(secret, Cipher.ENCRYPT_MODE);
        byte[] encrypted = cipher.doFinal(plainText.toString().getBytes());
        return Base64.getEncoder().encodeToString(encrypted);
    }

    public String decrypt(String value, String secret) throws Exception {
        Cipher cipher = this.initCipher(secret, Cipher.DECRYPT_MODE);
        byte[] decrypted = Base64.getDecoder().decode(value);
        return new String(cipher.doFinal(decrypted));
    }

    private Cipher initCipher(String secret, int mode) throws
        NoSuchPaddingException,
        NoSuchAlgorithmException,
        InvalidKeyException
    {
        var cipher = Cipher.getInstance(TRANSFORMATION);
        var secretKeySpec = new SecretKeySpec(secret.getBytes(), ALGORITHM);
        cipher.init(mode, secretKeySpec);
        return cipher;
    }
}
