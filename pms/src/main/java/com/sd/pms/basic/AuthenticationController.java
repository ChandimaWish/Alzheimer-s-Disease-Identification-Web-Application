package com.sd.pms.basic;

import com.sd.pms.app.exceptions.FieldValidationException;
import com.sd.pms.app.exceptions.HttpErrorException;
import com.sd.pms.app.util.PasswordValidatorUtil;
import com.sd.pms.auth.AuthenticationService;
import com.sd.pms.auth.dto.*;
import com.sd.pms.auth.service.PasswordResetService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    private final AuthenticationService authenticationService;
    private final PasswordResetService passwordResetService;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(@RequestBody RegisterRequest request){
        return ResponseEntity.ok(authenticationService.register(request));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponse> login(@RequestBody AuthenticationRequest request) throws HttpErrorException {
        return ResponseEntity.ok(authenticationService.login(request));
    }

    @PostMapping("/validateToken")
    public ResponseEntity<Object> validateToken(){
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/password-reset-get-url")
    public ResponseEntity<Map<String,String >> resetPassword(@RequestBody ResetPasswordDto resetPasswordDto) throws FieldValidationException, UnknownHostException {
        if(resetPasswordDto.getEmail() == null){
            throw new FieldValidationException("email is required!");
        }

        String url = passwordResetService.resetPassword(resetPasswordDto.getEmail());

        Map<String,String> respondMap = new HashMap<>();
        respondMap.put("url" , url);

        return ResponseEntity.ok(respondMap);
    }

    @PostMapping("/reset-password/{uuid}")
    public void resetPasswordConfirm(@PathVariable("uuid") String uuid , @RequestBody PasswordResetConformDto passwordResetConformDto) throws FieldValidationException {

        if (passwordResetConformDto.getPassword() == null || passwordResetConformDto.getPassword().equals("")) {
            throw new FieldValidationException("Password is required");
        }

        if (!PasswordValidatorUtil.isValidPassword(passwordResetConformDto.getPassword())) {
            throw new FieldValidationException("Invalid password format");
        }

        passwordResetService.conformResetPassword(passwordResetConformDto , uuid);
    }

}
