package com.sd.pms.app.service;

import com.sd.pms.app.repository.AdminRepository;
import com.sd.pms.app.repository.DoctorRepository;
import com.sd.pms.app.repository.PatientRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@RequiredArgsConstructor
public class SearchServiceImpl implements SearchService{

    private final PatientRepository patientRepository;
    private final DoctorRepository doctorRepository;
    private final AdminRepository adminRepository;

    @Override
    public List<?> searchByNameEmail(String query) {
        List<?> patients = patientRepository.findAllByUserSearchQuery(query);
        List<?> doctors = doctorRepository.findAllByUserSearchQuery(query);
        List<?> admins = adminRepository.findAllByUserSearchQuery(query);

        List<?> concatenatedList = Stream.of(patients, doctors, admins)
                .flatMap(List::stream)
                .collect(Collectors.toList());



        return concatenatedList;
    }

}
