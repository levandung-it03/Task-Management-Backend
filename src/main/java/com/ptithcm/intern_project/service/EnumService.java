package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.enums.TaskLevel;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Service
@NoArgsConstructor
public class EnumService {

    public List<Map<String, Float>> getTaskLevelEnums() {
        return Arrays.stream(TaskLevel.values())
            .map(taskLevel -> Map.of(
                taskLevel.toString(),
                taskLevel.getTimeRatio()
            ))
            .toList();
    }
}
