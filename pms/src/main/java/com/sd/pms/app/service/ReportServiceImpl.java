package com.sd.pms.app.service;

import com.sd.pms.app.dto.reports.CommentAddDto;
import com.sd.pms.app.dto.reports.ReportCreateRespond;
import com.sd.pms.app.dto.reports.ReportDto;
import com.sd.pms.app.dto.reports.ReportData;
import com.sd.pms.app.entity.Patient;
import com.sd.pms.app.entity.reports.Comments;
import com.sd.pms.app.entity.reports.AlReport;
import com.sd.pms.app.entity.reports.Report;
import com.sd.pms.app.exceptions.HttpErrorException;
import com.sd.pms.app.repository.CommentsRepository;
import com.sd.pms.app.repository.AlReportRepository;
import com.sd.pms.app.repository.PatientRepository;
import com.sd.pms.app.util.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReportServiceImpl implements ReportService{

    private final AlReportRepository alReportRepository;
    private final PatientRepository patientRepository;
    private final CommentsRepository commentsRepository;
    private final ImageService imageService;

    @Value("${file.report.dir}")
    private String fileUploadDir;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ReportCreateRespond addReport(MultipartFile file, ReportDto dto) throws IOException, HttpErrorException {

        Patient patient = patientRepository.findById(dto.getPatientId()).orElseThrow(() -> new HttpErrorException("Patient not found"));

        AlReport alReport = AlReport.builder()
                .prediction(dto.getPrediction())
                .fileName(file.getName())
                .patient(patient)
                .active(Boolean.TRUE)
                .reportedDate(dto.getReportedDate())
                .build();

        String filePath = saveFile(file , alReport);
        alReport.setFileDir(filePath);

        log.info("Fbs saved : {}" , alReport.toString());
        alReportRepository.save(alReport);

        Comments comments = Comments.builder()
                .comment(dto.getComment())
                .alReport(alReport)
                .build();

        commentsRepository.save(comments);

        // respond
        ReportCreateRespond reportCreateRespond = new ReportCreateRespond();
        BeanUtils.copyProperties(alReport, reportCreateRespond);

        reportCreateRespond.setComments(new ArrayList<>(commentsRepository.findAllByAlReport_IdOrderByCreatedAtDesc(alReport.getId())));

        return reportCreateRespond;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void removeReport(Long id) throws HttpErrorException, IOException {

        AlReport alReport = alReportRepository.findById(id).orElseThrow(() ->new HttpErrorException("Report not found"));
        alReport.setActive(Boolean.FALSE);
        alReportRepository.save(alReport);

        deleteFileByName(alReport.getFileDir());
    }

    @Override
    public ArrayList getReportByPatientId(String nic) throws HttpErrorException, IOException {
        ArrayList<AlReport> alReportArrayList = (ArrayList<AlReport>) alReportRepository.findAllByPatientNicAndActive(nic , Boolean.TRUE);
        ArrayList<ReportCreateRespond> respond = new ArrayList<>();
        if(alReportArrayList.size() == 0){
            Patient patient = patientRepository.findByNicAndActive(nic , Boolean.TRUE).orElseThrow(()-> new HttpErrorException("Patient not found"));
            AlReport alReport = AlReport.builder()
                    .patient(patient)
                    .id(0L)
                    .reportedDate(LocalDate.now())
                    .prediction("")
                    .build();

            ReportCreateRespond reportCreateRespond = new ReportCreateRespond();
            BeanUtils.copyProperties(alReport, reportCreateRespond);
            reportCreateRespond.setComments(new ArrayList<>(commentsRepository.findAllByAlReport_IdOrderByCreatedAtDesc(alReport.getId())));
            respond.add(reportCreateRespond);
        }else{
            for(AlReport alReport : alReportArrayList){
                ReportCreateRespond reportCreateRespond = new ReportCreateRespond();
                BeanUtils.copyProperties(alReport, reportCreateRespond);
                reportCreateRespond.setComments(new ArrayList<>(commentsRepository.findAllByAlReport_IdOrderByCreatedAtDesc(alReport.getId())));
                respond.add(reportCreateRespond);
            }
        }


        return respond;
    }

    @Override
    public ReportCreateRespond getReportById(Long id) throws HttpErrorException, IOException {
        AlReport alReport = alReportRepository.findById(id).orElseThrow(() ->new HttpErrorException("Report not found"));

        // respond
        ReportCreateRespond reportCreateRespond = new ReportCreateRespond();
        BeanUtils.copyProperties(alReport, reportCreateRespond);

        byte[] imageBytes = imageService.readImage(reportCreateRespond.getFileDir());
        reportCreateRespond.setBase64Image(imageService.convertToBase64(imageBytes));

        reportCreateRespond.setComments(new ArrayList<>(commentsRepository.findAllByAlReport_IdOrderByCreatedAtDesc(alReport.getId())));

        return reportCreateRespond;

    }

    @Override
    public ReportData getFbsReport(String nic) throws HttpErrorException, IOException {
        ArrayList<AlReport> dataAll = (ArrayList<AlReport>) alReportRepository.findAllByPatientNicAndActive(nic , Boolean.TRUE);
        ReportData reportData = new ReportData();
        return reportData;
    }


    @Override
    public String saveFile(MultipartFile file , Report report) throws IOException {

        // Rename the file to a timestamp
        String originalFileName = StringUtils.cleanPath(file.getOriginalFilename());
        String fileName = Instant.now().toEpochMilli() + "_" + originalFileName;

        // Save the file content to the file system
        Path uploadPath = Path.of(fileUploadDir).toAbsolutePath().normalize();
        Files.createDirectories(uploadPath);
        Path filePath = uploadPath.resolve(fileName);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        log.info("File saved at path: {}", filePath.toString());
        return filePath.toString();
    }

    @Override
    public void deleteFileByName(String filePathToDelete) throws IOException {

        if (filePathToDelete != null) {
            // Delete the file from the file system
            Path filePath = Path.of(filePathToDelete);
            Files.deleteIfExists(filePath);

            // Log the deletion
            log.info("File deleted at path: {}", filePath);

        } else {
            log.warn("File with name {} not found. Deletion skipped.", filePathToDelete);
        }
    }

    @Override
    public ReportCreateRespond addComments(CommentAddDto commentAddDto) throws HttpErrorException {
        AlReport alReport = alReportRepository.findById(commentAddDto.getDataId()).orElseThrow(()->new HttpErrorException("Report not found") );

        Comments comments = Comments.builder()
                .comment(commentAddDto.getComment())
                .alReport(alReport)
                .build();

        commentsRepository.save(comments);

        // respond
        ReportCreateRespond reportCreateRespond = new ReportCreateRespond();
        BeanUtils.copyProperties(alReport, reportCreateRespond);

        reportCreateRespond.setComments(new ArrayList<>(commentsRepository.findAllByAlReport_IdOrderByCreatedAtDesc(alReport.getId())));

        return reportCreateRespond;

    }
}
