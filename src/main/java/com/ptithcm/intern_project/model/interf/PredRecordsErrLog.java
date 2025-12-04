package com.ptithcm.intern_project.model.interf;

import com.ptithcm.intern_project.util.DateTimeUtil;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "interf_pred_record_err_log")
@FieldDefaults(level = AccessLevel.PRIVATE)
public class PredRecordsErrLog {

    @Id
    @Column(name = "req_time_id", unique = true)
    @Builder.Default
    String reqTimeId = DateTimeUtil.millisecondToStringTime(System.currentTimeMillis());

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "record_id", referencedColumnName = "record_id", updatable = false, nullable = true)
    TaskUserRecord record;

    @Column(name = "err_log", columnDefinition = "TEXT")
    String errLog;
}
