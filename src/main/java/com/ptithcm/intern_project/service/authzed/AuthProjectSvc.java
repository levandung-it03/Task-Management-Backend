//package com.ptithcm.intern_project.service.authzed;
//
//import com.authzed.api.v1.ObjectReference;
//import com.authzed.api.v1.Relationship;
//import com.authzed.api.v1.RelationshipUpdate;
//import com.authzed.api.v1.SubjectReference;
//import com.ptithcm.intern_project.model.ProjectRole;
//import lombok.AccessLevel;
//import lombok.RequiredArgsConstructor;
//import lombok.experimental.FieldDefaults;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
//@Service
//@RequiredArgsConstructor
//@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
//public class AuthProjectSvc {
//    AuthzedService authzedService;
//
//    /**
//     * e.g: [Object] project:123 --owner--> [Subject] user:42
//     */
//    public void addOwnerPermission(Long ownerId, Long projectId) {
//        var resourceRef = ObjectReference.newBuilder()
//            .setObjectType(AuthzedValue.Project.NAME.getValue())
//            .setObjectId(projectId.toString())
//            .build();
//
//        var subjectRef = SubjectReference.newBuilder()
//            .setObject(ObjectReference.newBuilder()
//                .setObjectType(AuthzedValue.User.NAME.getValue())
//                .setObjectId(ownerId.toString())
//                .build())
//            .build();
//
//        var relationship = Relationship.newBuilder()
//            .setResource(resourceRef)
//            .setRelation(AuthzedValue.Project.ROLE_OWNER.getValue())
//            .setSubject(subjectRef)
//            .build();
//
//        authzedService.updateRelationships(List.of(relationship), RelationshipUpdate.Operation.OPERATION_CREATE);
//    }
//
//    public void addMembersPermission(List<ProjectRole> projectRoles, Long projectId) {
//        var relationships = projectRoles.stream()
//            .map(projectRole -> {
//                var resourceRef = ObjectReference.newBuilder()
//                    .setObjectType(AuthzedValue.Project.NAME.getValue())
//                    .setObjectId(projectId.toString())
//                    .build();
//
//                var subjectRef = SubjectReference.newBuilder()
//                    .setObject(ObjectReference.newBuilder()
//                        .setObjectType(AuthzedValue.User.NAME.getValue())
//                        .setObjectId(projectRole.getUserInfo().getId().toString())
//                        .build())
//                    .build();
//
//                return Relationship.newBuilder()
//                    .setResource(resourceRef)
//                    .setRelation(AuthzedValue.Project.ROLE_OWNER.getValue())
//                    .setSubject(subjectRef)
//                    .build();
//            })
//            .toList();
//        authzedService.updateRelationships(relationships, RelationshipUpdate.Operation.OPERATION_CREATE);
//    }
//}
