package com.ptithcm.intern_project.jpa.model.enums;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum TaskLevel {
    HARD(1.8f),
    ADVANCED(1.3f),
    NORMAL(1.0f),
    LIGHT(0.8f),
    ;
    float timeRatio;
    public static final float DEFAULT_POINT = 1f;
    public static final float POINT_PER_HOUR = 0.1f;
}