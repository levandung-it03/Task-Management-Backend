package com.ptithcm.intern_project.services;

import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
@NoArgsConstructor
public class EnumService {

    public <E extends Enum<E>> HashMap<String, String> buildEnum(Class<E> enumClass) {
        var response = new HashMap<String, String>();
        for (E e : enumClass.getEnumConstants()) {
            response.put(e.name(), e.toString());
        }
        return response;
    }
}
