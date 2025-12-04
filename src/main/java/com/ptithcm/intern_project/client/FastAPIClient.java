package com.ptithcm.intern_project.client;

import com.ptithcm.intern_project.client.intefaces.IFastAPIClient;
import com.ptithcm.intern_project.config.constvalues.BeanNames;
import com.ptithcm.intern_project.config.constvalues.Headers;
import com.ptithcm.intern_project.service.auth.CryptoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
public class FastAPIClient implements IFastAPIClient {
    private final String FAST_API_COM_KEY;
    private final String FAST_API_COM_MSG;
    private final WebClient fastApiWebClient;
    private final CryptoService cryptoService;

    @Autowired
    public FastAPIClient(
        @Qualifier(BeanNames.FAST_API_WEBCLIENT) WebClient fastApiWebClient,
        @Value("${env.fastapi.communicate-key}") String fastApiComKey,
        @Value("${env.fastapi.communicate-msg}") String fastApiComMsg,
        CryptoService cryptoService
    ) {
        this.fastApiWebClient = fastApiWebClient;
        this.FAST_API_COM_KEY = fastApiComKey;
        this.FAST_API_COM_MSG = fastApiComMsg;
        this.cryptoService = cryptoService;
    }

    @Override
    public <T, R> R post(String path, T body, Class<R> responseType) throws Exception {
        String apiKey = cryptoService.encrypt(FAST_API_COM_MSG, FAST_API_COM_KEY);
        return fastApiWebClient.post()
            .uri(path)
            .header(Headers.X_API_KEY, apiKey)
            .bodyValue(body)
            .retrieve()
            .bodyToMono(responseType)
            .block();
    }


    @Override
    public <T, R> R put(String path, T body, Class<R> responseType) throws Exception {
        String apiKey = cryptoService.encrypt(FAST_API_COM_MSG, FAST_API_COM_KEY);
        return fastApiWebClient.put()
            .uri(path)
            .header(Headers.X_API_KEY, apiKey)
            .bodyValue(body)
            .retrieve()
            .bodyToMono(responseType)
            .block();
    }

}
