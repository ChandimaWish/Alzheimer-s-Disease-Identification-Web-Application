package com.sd.pms.auth.service;

import com.sd.pms.auth.dto.PasswordResetConformDto;
import com.sd.pms.auth.user.PasswordResetLog;
import com.sd.pms.auth.user.PasswordResetLogRepository;
import com.sd.pms.auth.user.User;
import com.sd.pms.auth.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.UnknownHostException;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class PasswordResetService
{
    private final UserRepository userRepository;
    private final PasswordResetLogRepository passwordResetLogRepository;
    private final PasswordEncoder passwordEncoder;

    public String resetPassword(String email) throws UnknownHostException {

        // check if user is available
        User user = userRepository.findByEmail(email).orElseThrow(()->new RuntimeException("User not found"));

        PasswordResetLog passwordResetLog = PasswordResetLog.builder()
                .email(user.getEmail())
                .uuid(UUID.randomUUID().toString())
                .isActive(Boolean.TRUE)
                .build();

        passwordResetLog.setUrl(getHostURL()+"/api/v1/auth/reset-password/"+passwordResetLog.getUuid());
        passwordResetLogRepository.save(passwordResetLog);

        return passwordResetLog.getUrl();

    }

    private String getHostURL() {
        return ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();
    }

    public void conformResetPassword(PasswordResetConformDto passwordResetConformDto, String uuid) {
        PasswordResetLog passwordResetLog = passwordResetLogRepository.findByUuidAndIsActive(uuid , Boolean.TRUE).orElseThrow(() -> new RuntimeException("Your password reset token has been expired"));
        User user = userRepository.findByEmail(passwordResetLog.getEmail()).orElseThrow(()->new RuntimeException("User not found"));

        user.setPassword(passwordEncoder.encode(passwordResetConformDto.getPassword()));
        passwordResetLog.setIsActive(Boolean.FALSE);
        userRepository.save(user);
        passwordResetLogRepository.save(passwordResetLog);
    }
}
