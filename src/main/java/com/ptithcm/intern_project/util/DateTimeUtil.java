package com.ptithcm.intern_project.util;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class DateTimeUtil {
    public static final DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
    public static final DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public static String millisecondToStringTime(long milli) {
        LocalDateTime time = Instant.ofEpochMilli(milli)
            .atZone(ZoneId.systemDefault())
            .toLocalDateTime();
        return timeFormatter.format(time);
    }

    public static long timeToMilli(LocalDateTime time) {
        return time.atZone(ZoneId.systemDefault())
            .toInstant()
            .toEpochMilli();
    }

    public static LocalDate stringToLocalDate(String dateTime) {
        return LocalDate.parse(dateTime, dateFormatter);
    }

    public static LocalDateTime stringToLocalDateTime(String time) {
        return LocalDateTime.parse(time, timeFormatter);
    }
}
