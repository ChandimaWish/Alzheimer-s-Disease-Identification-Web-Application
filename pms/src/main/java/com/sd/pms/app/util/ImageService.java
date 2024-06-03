package com.sd.pms.app.util;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

@Service
public class ImageService {

    public byte[] readImage(String filePath) throws IOException {
        Path imagePath = Paths.get(filePath);
        return Files.readAllBytes(imagePath);
    }

    public String convertToBase64(byte[] imageBytes) {
        return Base64.getEncoder().encodeToString(imageBytes);
    }
}