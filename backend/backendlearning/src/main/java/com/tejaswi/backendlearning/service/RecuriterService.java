package com.tejaswi.backendlearning.service;

import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.tejaswi.backendlearning.dto.RecruiterLoginRequest;
import com.tejaswi.backendlearning.dto.RecruiterRegistrationRequest;
import com.tejaswi.backendlearning.entity.Recruiter;
import com.tejaswi.backendlearning.repository.RecruiterRepository;
@Service
public class RecuriterService {
	
	private final RecruiterRepository recruiterRepository;
	private final PasswordEncoder passwordEncoder;
	
	public RecuriterService(RecruiterRepository recruiterRepository,PasswordEncoder passwordEncoder) {
		this.recruiterRepository=recruiterRepository;
		this.passwordEncoder=passwordEncoder;
	}
	
	public Recruiter register(RecruiterRegistrationRequest request) {
		if(recruiterRepository.existsByEmail(request.getEmail())) {
			throw new ResponseStatusException(HttpStatus.CONFLICT,"Email alreasy exists");
		}
		Recruiter recruiter=new Recruiter();
		recruiter.setName(request.getName());
		recruiter.setEmail(request.getEmail());
		recruiter.setPassword(passwordEncoder.encode(request.getPassword()));
		
		return recruiterRepository.save(recruiter);
	}
	
	
	
	public Recruiter login(RecruiterLoginRequest request) {
		Recruiter recruiter=recruiterRepository.findByemail(request.getEmail())
				.orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Invalis email or password"));
				
				if(!passwordEncoder.matches(request.getPassword(), recruiter.getPassword())) {
					throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Invalid email or password");
					
					
				}
				return recruiter;
	}

}
