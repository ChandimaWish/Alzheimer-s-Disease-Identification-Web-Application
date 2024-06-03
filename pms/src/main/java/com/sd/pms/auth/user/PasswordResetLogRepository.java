package com.sd.pms.auth.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PasswordResetLogRepository extends JpaRepository<PasswordResetLog,Long> {
    Optional<PasswordResetLog> findByUuidAndIsActive(String uuid, Boolean isActive);
}
