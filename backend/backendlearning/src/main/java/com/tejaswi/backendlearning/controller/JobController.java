package com.tejaswi.backendlearning.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tejaswi.backendlearning.dto.JobCreateRequest;
import com.tejaswi.backendlearning.dto.JobUpdateRequest;
import com.tejaswi.backendlearning.entity.Job;
import com.tejaswi.backendlearning.service.JobService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/jobs")
public class JobController {
	private final JobService jobService;
	public JobController(JobService jobService) {
		this.jobService=jobService;
	}
	
	
	
	@PostMapping
	public ResponseEntity<Job> crete(@Valid @RequestBody JobCreateRequest request){
		
		Job savedjob=jobService.createJob(request);
		return ResponseEntity.status(HttpStatus.CREATED)
				.body(savedjob);
		
	}
	
	@GetMapping
	public List<Job>getall(){
		return jobService.getalljobs();
	}
	
	@GetMapping("/recruiter/{recuriterId}")
	public List<Job> getjobbyrecuriter(@PathVariable Long recuriterId){
		return jobService.getjobsbyrecuriterid(recuriterId);
	}

	
	@GetMapping("/{jobId}")
	public Job getJobById(
	        @PathVariable Long jobId,@RequestParam Long  recruiterId) {

	    return jobService.getJobByIdAndRecruiter(
	            jobId,
	            recruiterId
	    );
	}
	@PutMapping("/{jobId}")
	public Job updateJob(
	        @PathVariable Long jobId,
	        @RequestParam Long recruiterId,
	        @Valid @RequestBody JobUpdateRequest request) {

	    return jobService.updateJob(
	            jobId,
	            recruiterId,
	            request
	    );
	}
	
	
	@DeleteMapping("/{jobId}")
	public ResponseEntity<Void> deleteJob(
	        @PathVariable Long jobId,
	        @RequestParam Long recruiterId) {

	    jobService.deleteJob(jobId, recruiterId);

	    return ResponseEntity.noContent().build();
	}
}
