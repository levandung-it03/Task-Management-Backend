package com.ptithcm.intern_project.client.intefaces;

public interface IFastAPIClient {
    <T, R> R post(String path, T body, Class<R> responseType) throws Exception;

    <T, R> R put(String path, T body, Class<R> responseType) throws Exception;
}
