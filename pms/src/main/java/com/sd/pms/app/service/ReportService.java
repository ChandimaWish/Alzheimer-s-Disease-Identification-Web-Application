package com.sd.pms.app.service;

import com.sd.pms.app.dto.reports.*;
import com.sd.pms.app.entity.reports.*;
import com.sd.pms.app.exceptions.HttpErrorException;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;

public interface ReportService {
    ReportCreateRespond addReport(MultipartFile file , ReportDto dto) throws IOException, HttpErrorException;
    void removeReport(Long id) throws HttpErrorException, IOException;
    ArrayList getReportByPatientId(String id) throws HttpErrorException, IOException;
    ReportCreateRespond getReportById(Long id) throws HttpErrorException, IOException;
    ReportData getFbsReport(String nic) throws HttpErrorException, IOException;


    String saveFile(MultipartFile file , Report report) throws IOException;
    public void deleteFileByName(String filePathToDelete) throws IOException;

    ReportCreateRespond addComments(CommentAddDto commentAddDto) throws HttpErrorException;
}
