package com.sd.pms.app.repository;

import com.sd.pms.app.entity.reports.AlReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlReportRepository extends JpaRepository<AlReport,Long> {
    List<AlReport> findAllByPatientNicAndActive(String nic , Boolean active);
}
