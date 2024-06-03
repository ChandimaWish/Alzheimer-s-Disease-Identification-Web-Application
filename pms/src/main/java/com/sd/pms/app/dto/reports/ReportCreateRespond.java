package com.sd.pms.app.dto.reports;

import com.sd.pms.app.entity.Patient;
import com.sd.pms.app.entity.reports.Comments;
import lombok.Data;

import java.time.LocalDate;
import java.util.ArrayList;

@Data
public class ReportCreateRespond {
    private Long id;
    private Patient patient;
    private LocalDate reportedDate;
    private String prediction;
    private String fileDir;
    private String fileName;
    private Boolean active;
    private String base64Image;
    private ArrayList<Comments> comments;
}
