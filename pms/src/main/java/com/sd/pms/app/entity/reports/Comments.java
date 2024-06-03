package com.sd.pms.app.entity.reports;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sd.pms.app.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Entity
@Table(name = "TBL_COMMENT")
public class Comments extends BaseEntity implements Report{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "COMMENT")
    private String comment;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "REPORT_ID")
    private AlReport alReport;
}
