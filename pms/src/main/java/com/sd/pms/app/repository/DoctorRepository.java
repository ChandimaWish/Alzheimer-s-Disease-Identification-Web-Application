package com.sd.pms.app.repository;

import com.sd.pms.app.entity.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor,Long> {
    List<Doctor> findAllByActive(Boolean aTrue);
    @Query("from Doctor d where d.user.firstName like %:value% or d.user.lastName like %:value% or d.user.email like %:value%")
    List<Doctor> findAllByUserSearchQuery(@Param("value") String value);
}
