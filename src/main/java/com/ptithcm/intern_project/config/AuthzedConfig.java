//package com.ptithcm.intern_project.config;
//
//import com.authzed.api.v1.PermissionServiceGrpc;
//import com.authzed.grpcutil.BearerToken;
//
//import io.grpc.ManagedChannel;
//import io.grpc.ManagedChannelBuilder;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//public class AuthzedConfig {
//
//    @Bean
//    public ManagedChannel authzedChannel() {
//        return ManagedChannelBuilder
//                .forAddress("grpc.authzed.com", 443)
//                .useTransportSecurity()
//                .build();
//    }
//
//    @Bean
//    public PermissionServiceGrpc.PermissionServiceBlockingStub authzedStub(ManagedChannel channel) {
//        return PermissionServiceGrpc.newBlockingStub(channel)
//                .withCallCredentials(new BearerToken("your-authzed-token"));
//    }
//}
