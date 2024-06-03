package com.sd.pms.app.controller;

import com.sd.pms.app.service.SearchService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v2/search")
public class SearchController {

    private final SearchService searchService;

    @GetMapping("/filter")
    public ResponseEntity<?> searchPeople(@RequestParam("query") String query){
        ArrayList<?> obj = (ArrayList<?>) searchService.searchByNameEmail(query);
        return new ResponseEntity<>(obj , HttpStatus.OK);
    }

}
