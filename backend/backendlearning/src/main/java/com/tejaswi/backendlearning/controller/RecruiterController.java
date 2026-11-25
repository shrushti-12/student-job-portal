package com.tejaswi.backendlearning.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tejaswi.backendlearning.dto.RecruiterLoginRequest;
import com.tejaswi.backendlearning.dto.RecruiterRegistrationRequest;
import com.tejaswi.backendlearning.dto.RecruiterResponse;
import com.tejaswi.backendlearning.entity.Recruiter;
import com.tejaswi.backendlearning.service.RecuriterService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/recruiters")
public class RecruiterController {
	
	private final RecuriterService recuriterService;
	public RecruiterController(RecuriterService recuriterService) {
		this.recuriterService=recuriterService;
	}
	
	@PostMapping("/register")
	@ResponseStatus(HttpStatus.CREATED)
	public RecruiterResponse register(@Valid @RequestBody RecruiterRegistrationRequest request) {
	    Recruiter recruiter=recuriterService.register(request);
	    
	    return new RecruiterResponse(recruiter.getId(),
	    		recruiter.getName(),
	    		recruiter.getEmail());
	}
	
	
	@PostMapping("/login")
	public RecruiterResponse login(@Valid @RequestBody RecruiterLoginRequest request) {
		Recruiter recruiter=recuriterService.login(request);
		return new RecruiterResponse(recruiter.getId(),
				recruiter.getEmail(),
				recruiter.getName());
	}

}
