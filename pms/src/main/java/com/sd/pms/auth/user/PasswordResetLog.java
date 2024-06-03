package com.sd.pms.auth.user;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "PASSWORD_RESET_LOG")
public class PasswordResetLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "UUID")
    private String uuid;

    @Column(name = "URL")
    private String url;

    @Column(name = "IS_ACTIVE")
    private Boolean isActive;

}
