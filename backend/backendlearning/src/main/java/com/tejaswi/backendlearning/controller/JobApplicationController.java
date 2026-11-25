package com.tejaswi.backendlearning.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tejaswi.backendlearning.dto.ApplyJobRequest;
import com.tejaswi.backendlearning.entity.JobApplication;
import com.tejaswi.backendlearning.service.JonApplicationService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/applications")
public class JobApplicationController {
	private final JonApplicationService applicationService;
	public JobApplicationController(JonApplicationService applicationService) {
		this.applicationService=applicationService;
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
   public JobApplication apply(@Valid @RequestBody ApplyJobRequest request) {
		return applicationService.applyforJob(request);
	}
	
	@GetMapping("/student/{studentId}")
	public List<JobApplication> getallapplications(@PathVariable Integer studentId){
		return applicationService.getApplicationByStudent(studentId);
	}
	
	@GetMapping("/recruiter/{recruiterId}")
	public List<JobApplication> getApplicationsByRecruiter(
	        @PathVariable Long recruiterId) {

	    return applicationService.getApplicationsByRecruiter(recruiterId);
	}
	@PutMapping("/{applicationId}/status")
	public JobApplication updateApplicationStatus(
	        @PathVariable Long applicationId,
	        @RequestParam Long recruiterId,
	        @RequestParam String status) {

	    return applicationService.updateApplicationStatus(
	            applicationId,
	            recruiterId,
	            status);
	}
	
}
