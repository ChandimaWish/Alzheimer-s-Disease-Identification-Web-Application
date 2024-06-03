package com.sd.pms.app.controller;

import com.sd.pms.app.dto.reports.*;
import com.sd.pms.app.entity.reports.*;
import com.sd.pms.app.exceptions.FieldValidationException;
import com.sd.pms.app.exceptions.HttpErrorException;
import com.sd.pms.app.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v2/reports")
public class ReportsController {

    private final ReportService reportService;

    @PostMapping("/addReport")
    public ResponseEntity<?> addReport(@ModelAttribute ReportDto dto) throws FieldValidationException, HttpErrorException, IOException {

        if(dto.getReport() == null){
            throw new FieldValidationException("Report file is required!");
        }

        if (dto.getPatientId() == null) {
            throw new FieldValidationException("Patient is required!");
        }

        if (dto.getPrediction() == null) {
            throw new FieldValidationException("Prediction is required!");
        }

        if (dto.getComment() == null || dto.getComment().equals("")) {
            throw new FieldValidationException("Comment is required!");
        }

        ReportCreateRespond report = reportService.addReport(dto.getReport() , dto);

        return new ResponseEntity<>(report, HttpStatus.CREATED);

    }

    @PostMapping("/addNewComment")
    private ResponseEntity<?> addNewComment(@RequestBody CommentAddDto commentAddDto) throws FieldValidationException, HttpErrorException {
        if(commentAddDto.getDataId() == null){
            throw new FieldValidationException("Report file is required!");
        }

        if (commentAddDto.getComment() == null || commentAddDto.getComment().equals("")) {
            throw new FieldValidationException("Comment is required!");
        }

        ReportCreateRespond reportCreateRespond = reportService.addComments(commentAddDto);

        return new ResponseEntity<>(reportCreateRespond, HttpStatus.CREATED);
    }

    @PostMapping("/removeReport")
    public ResponseEntity<?> removeReport(@RequestParam("reportId") Long id) throws FieldValidationException, IOException, HttpErrorException {
        if (id == null) {
            throw new FieldValidationException("Report id is required!");
        }

        reportService.removeReport(id);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/findAllBy")
    public ResponseEntity<?> findAllReport(@RequestParam("nic") String nic) throws FieldValidationException, IOException, HttpErrorException {
        if (nic == null) {
            throw new FieldValidationException("NIC is required");
        }

        ArrayList<AlReport> alReportList = reportService.getReportByPatientId(nic);

        return new ResponseEntity<>(alReportList, HttpStatus.OK);
    }

    @GetMapping("/report")
    public ResponseEntity<?> findReportById(@RequestParam("id") Long id) throws FieldValidationException, IOException, HttpErrorException {
        if (id == null) {
            throw new FieldValidationException("ID is required");
        }

        ReportCreateRespond respond = reportService.getReportById(id);

        return new ResponseEntity<>(respond , HttpStatus.OK);
    }

    @GetMapping("/fbsReport")
    public ResponseEntity<?> findFbsByNic(@RequestParam("nic") String nic) throws FieldValidationException, IOException, HttpErrorException {
        if (nic == null) {
            throw new FieldValidationException("NIC is required");
        }

        ReportData reportData = reportService.getFbsReport(nic);

        return new ResponseEntity<>(reportData , HttpStatus.OK);
    }


}
