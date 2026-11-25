package com.tejaswi.backendlearning.controller;

//import java.awt.PageAttributes.MediaType;
import org.springframework.http.MediaType;
import java.io.IOException;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tejaswi.backendlearning.entity.Student;
import com.tejaswi.backendlearning.repository.StudentReposistoy;
//import com.tejaswi.backendlearning.repository.StudentRepository;

@RestController
@RequestMapping("/api/students")
public class ResumeController {

    private final StudentReposistoy studentRepository;

    public ResumeController(StudentReposistoy studentRepository) {
        this.studentRepository = studentRepository;
    }

    @PostMapping("/{studentId}/resume")
    public ResponseEntity<String> uploadResume(
            @PathVariable int studentId,
            @RequestParam("resume") MultipartFile file) {

        try {

            if (file.isEmpty()) {
                return ResponseEntity
                        .badRequest()
                        .body("Please select a resume file.");
            }

            if (!"application/pdf".equalsIgnoreCase(file.getContentType())) {
                return ResponseEntity
                        .badRequest()
                        .body("Only PDF resumes are allowed.");
            }

            Student student = studentRepository.findById(studentId)
                    .orElse(null);

            if (student == null) {
                return ResponseEntity
                        .status(HttpStatus.NOT_FOUND)
                        .body("Student not found.");
            }

            student.setResume(file.getBytes());
            student.setResumeName(file.getOriginalFilename());

            studentRepository.save(student);

            return ResponseEntity
                    .status(HttpStatus.CREATED)
                    .body("Resume uploaded successfully.");

        } catch (IOException e) {

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to upload resume.");

        }
    }
    
    @GetMapping("/{studentId}/resume/exists")
    public ResponseEntity<Boolean> resumeExists(
            @PathVariable int studentId) {

        Student student = studentRepository.findById(studentId)
                .orElse(null);

        if (student == null) {
            return ResponseEntity.notFound().build();
        }

        boolean exists = student.getResume() != null
                && student.getResume().length > 0;

        return ResponseEntity.ok(exists);
    }
    
    
    @GetMapping("/{studentId}/resume")
    public ResponseEntity<byte[]> getResume(
            @PathVariable int studentId) {

        Student student = studentRepository.findById(studentId)
                .orElse(null);

        if (student == null) {
            return ResponseEntity.notFound().build();
        }

        if (student.getResume() == null
                || student.getResume().length == 0) {

            return ResponseEntity.notFound().build();
        }

        String fileName = student.getResumeName();

        if (fileName == null || fileName.trim().isEmpty()) {
            fileName = "resume.pdf";
        }

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(
                        HttpHeaders.CONTENT_DISPOSITION,
                        "inline; filename=\"" + fileName + "\"")
                .body(student.getResume());
    }
}