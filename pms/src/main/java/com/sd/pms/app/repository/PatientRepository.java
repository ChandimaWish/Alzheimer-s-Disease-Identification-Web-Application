package com.sd.pms.app.repository;

import com.sd.pms.app.entity.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {
    List<Patient> findAllByActive(Boolean aTrue);

    @Query("from Patient p where p.user.firstName like %:value% or p.user.lastName like %:value% or p.user.email like %:value%")
    List<Patient> findAllByUserSearchQuery(@Param("value") String value);

    Optional<Patient> findByNicAndActive(String nic , Boolean active);
    Optional<Patient> findByUserId(Long id);
}
