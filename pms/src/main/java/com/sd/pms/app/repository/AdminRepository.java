package com.sd.pms.app.repository;

import com.sd.pms.app.entity.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminRepository extends JpaRepository<Admin,Long> {
    List<Admin> findAllByActive(Boolean aTrue);

    @Query("from Admin a where a.user.firstName like %:value% or a.user.lastName like %:value% or a.user.email like %:value%")
    List<Admin> findAllByUserSearchQuery(@Param("value") String value);
}
