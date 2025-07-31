package com.ptithcm.intern_project.config;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenAPISwaggerConfig {

    @Bean
    public GroupedOpenApi allApis() {
        return GroupedOpenApi.builder().group("All").pathsToMatch("/api/**").build();
    }

    @Bean
    public GroupedOpenApi departmentApis() {
        return GroupedOpenApi.builder().group("Department").pathsToMatch("/api/**/department/**").build();
    }

    @Bean
    public GroupedOpenApi enumsApis() {
        return GroupedOpenApi.builder().group("Enums").pathsToMatch("/api/**/enum/**").build();
    }

    @Bean
    public GroupedOpenApi authApis() {
        return GroupedOpenApi.builder().group("Auth").pathsToMatch("/api/**/auth/**").build();
    }

    @Bean
    public GroupedOpenApi collectionApis() {
        return GroupedOpenApi.builder().group("Collection").pathsToMatch("/api/**/collection/**").build();
    }

    @Bean
    public GroupedOpenApi groupApis() {
        return GroupedOpenApi.builder().group("Group").pathsToMatch("/api/**/group/**").build();
    }

    @Bean
    public GroupedOpenApi groupHasUsersApis() {
        return GroupedOpenApi.builder().group("Group-has-User").pathsToMatch("/api/**/group-user/**").build();
    }

    @Bean
    public GroupedOpenApi phaseApis() {
        return GroupedOpenApi.builder().group("Phase").pathsToMatch("/api/**/phase/**").build();
    }

    @Bean
    public GroupedOpenApi projectApis() {
        return GroupedOpenApi.builder().group("Project").pathsToMatch("/api/**/project/**").build();
    }

    @Bean
    public GroupedOpenApi reportApis() {
        return GroupedOpenApi.builder().group("Report").pathsToMatch("/api/**/report/**").build();
    }

    @Bean
    public GroupedOpenApi taskApis() {
        return GroupedOpenApi.builder().group("Task").pathsToMatch("/api/**/task/**").build();
    }

    @Bean
    public GroupedOpenApi taskForUsersApis() {
        return GroupedOpenApi.builder().group("Task-for-Users").pathsToMatch("/api/**/task-user/**").build();
    }

    @Bean
    public GroupedOpenApi userInfoApis() {
        return GroupedOpenApi.builder().group("User Info").pathsToMatch("/api/**/user-info/**").build();
    }
}
