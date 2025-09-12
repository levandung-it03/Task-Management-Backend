//package com.ptithcm.intern_project.service.authzed;
//
//import com.authzed.api.v1.*;
//import com.authzed.grpcutil.BearerToken;
//import com.ptithcm.intern_project.config.enums.ErrorCodes;
//import io.grpc.ManagedChannel;
//import io.grpc.ManagedChannelBuilder;
//import io.grpc.StatusRuntimeException;
//import jakarta.annotation.PostConstruct;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Service;
//import org.springframework.web.context.annotation.ApplicationScope;
//
//import java.util.List;
//import java.util.concurrent.TimeUnit;
//
//@Service
//@ApplicationScope
//@Slf4j
//public class AuthzedService {
//    private final int MAX_TIMEOUT_SEC = 10;
//    private final String ENDPOINT;
//    private final String TOKEN;
//    private PermissionsServiceGrpc.PermissionsServiceBlockingStub permissionsStub;
//
//    @Autowired
//    public AuthzedService(@Value("env.authzed.endpoint") String endpoint, @Value("env.authzed.token") String token) {
//        this.ENDPOINT = endpoint;
//        this.TOKEN = token;
//    }
//
//    @PostConstruct
//    public void init() {
//        ManagedChannel channel = ManagedChannelBuilder.forTarget(ENDPOINT)
//            .usePlaintext() //--Use TLS in production
//            .build();
//        permissionsStub = PermissionsServiceGrpc.newBlockingStub(channel)
//            .withCallCredentials(new BearerToken(TOKEN));
//    }
//
//    public boolean checkPermission(CheckPermissionRequest request) {
//        try {
//            CheckPermissionResponse response = permissionsStub
//                .withDeadlineAfter(MAX_TIMEOUT_SEC, TimeUnit.SECONDS)
//                .checkPermission(request);
//            return response.getPermissionship() == CheckPermissionResponse.Permissionship.PERMISSIONSHIP_HAS_PERMISSION;
//        } catch (StatusRuntimeException e) {
//            System.err.println("Failed to check permission: " + e.getStatus());
//            return false;
//        }
//    }
//
//    public void updateRelationships(List<Relationship> relationships, RelationshipUpdate.Operation operation) {
//        var requestBuilder = WriteRelationshipsRequest.newBuilder();
//        for (Relationship relationship : relationships) {
//            requestBuilder.addUpdates(RelationshipUpdate.newBuilder()
//                .setOperation(operation)
//                .setRelationship(relationship)
//                .build());
//        }
//        try {
//            permissionsStub
//                .withDeadlineAfter(MAX_TIMEOUT_SEC, TimeUnit.SECONDS)
//                .writeRelationships(requestBuilder.build());
//        } catch (StatusRuntimeException e) {
//            log.error(ErrorCodes.UPDATE_AUTHZED_REL.getMsg(), e.getStatus());
//        }
//    }
//}
//
/////**
//// * Gán user vào role (e.g., role:owner#member@user:3).
//// */
////public void assignUserToRole(String roleId, String userId) {
////    var resourceRef = ObjectReference.newBuilder()
////        .setObjectType("role")
////        .setObjectId(roleId)
////        .build();
////
////    var subjectRef = SubjectReference.newBuilder()
////        .setObject(ObjectReference.newBuilder()
////            .setObjectType("user")
////            .setObjectId(userId)
////            .build())
////        .build();
////
////    var relationship = Relationship.newBuilder()
////        .setResource(resourceRef)
////        .setRelation("member")
////        .setSubject(subjectRef)
////        .build();
////
////    var request = WriteRelationshipsRequest.newBuilder()
////        .addUpdates(RelationshipUpdate.newBuilder()
////            .setOperation(RelationshipUpdate.Operation.OPERATION_CREATE)
////            .setRelationship(relationship)
////            .build())
////        .build();
////
////    try {
////        permissionsStub.withDeadlineAfter(10, TimeUnit.SECONDS).writeRelationships(request);
////        log.info("Assigned user: {} to role: {}", userId, roleId);
////    } catch (StatusRuntimeException e) {
////        log.error("Failed to assign user to role: {}", e.getStatus());
////    }
////}
////
/////**
//// * Gán role vào project (e.g., project:proj1#role_assignment@role:owner).
//// */
////public void assignRoleToProject(String projectId, String roleId) {
////    var resourceRef = ObjectReference.newBuilder()
////        .setObjectType("project")
////        .setObjectId(projectId)
////        .build();
////
////    var subjectRef = SubjectReference.newBuilder()
////        .setObject(ObjectReference.newBuilder()
////            .setObjectType("role")
////            .setObjectId(roleId)
////            .build())
////        .build();
////
////    var relationship = Relationship.newBuilder()
////        .setResource(resourceRef)
////        .setRelation("role_assignment")
////        .setSubject(subjectRef)
////        .build();
////
////    var request = WriteRelationshipsRequest.newBuilder()
////        .addUpdates(RelationshipUpdate.newBuilder()
////            .setOperation(RelationshipUpdate.Operation.OPERATION_CREATE)
////            .setRelationship(relationship)
////            .build())
////        .build();
////
////    try {
////        permissionsStub.withDeadlineAfter(10, TimeUnit.SECONDS).writeRelationships(request);
////        System.out.println("Assigned role: " + roleId + " to project: " + projectId);
////    } catch (StatusRuntimeException e) {
////        System.err.println("Failed to assign role to project: " + e.getStatus());
////    }
////}
////
/////**
//// * Check permission trên project.
//// */
////public boolean checkPermission(String projectId, String permission, String userId) {
////    var resourceRef = ObjectReference.newBuilder()
////        .setObjectType("project")
////        .setObjectId(projectId)
////        .build();
////
////    var subjectRef = SubjectReference.newBuilder()
////        .setObject(ObjectReference.newBuilder()
////            .setObjectType("user")
////            .setObjectId(userId)
////            .build())
////        .build();
////
////    var request = CheckPermissionRequest.newBuilder()
////        .setResource(resourceRef)
////        .setPermission(permission)
////        .setSubject(subjectRef)
////        .build();
////
////    try {
////        CheckPermissionResponse response = permissionsStub
////            .withDeadlineAfter(10, TimeUnit.SECONDS)
////            .checkPermission(request);
////        return response.getPermissionship() == CheckPermissionResponse.Permissionship.PERMISSIONSHIP_HAS_PERMISSION;
////    } catch (StatusRuntimeException e) {
////        System.err.println("Failed to check permission: " + e.getStatus());
////        return false;
////    }
////}
