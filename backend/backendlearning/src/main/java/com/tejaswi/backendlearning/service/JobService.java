package com.tejaswi.backendlearning.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tejaswi.backendlearning.dto.JobCreateRequest;
import com.tejaswi.backendlearning.dto.JobUpdateRequest;
import com.tejaswi.backendlearning.entity.Job;
import com.tejaswi.backendlearning.entity.Recruiter;
import com.tejaswi.backendlearning.repository.JobRepository;
import com.tejaswi.backendlearning.repository.RecruiterRepository;

import jakarta.transaction.Transactional;
@Service
public class JobService {
 
	
	private final JobRepository jobRepository;
	private final RecruiterRepository recruiterRepository;
	public JobService(JobRepository jobRepository,RecruiterRepository recruiterRepository) {
		this.jobRepository=jobRepository;
		this.recruiterRepository=recruiterRepository;
	}
	        
	public Job crete(Job job) {
		return jobRepository.save(job);
	}
	
	public List<Job> getalljobs(){
		return jobRepository.findAll();
	}
	
	
	public Job createJob(JobCreateRequest request) {
		
		Recruiter recruiter=recruiterRepository.findById(request.getRecruiterId()).orElseThrow(() -> new RuntimeException("Recuriter not found"));
		Job job=new Job();
		job.setTitle(request.getTitle());
		job.setCompany(request.getCompany());
		job.setLocation(request.getLocation());
		job.setDescription(request.getDescription());
		job.setRequiredSkills(request.getRequiredSkills());
		job.setJobType(request.getJobType());
		job.setRecruiter(recruiter);
		
		return jobRepository.save(job);
			
		}
	
	public List<Job> getjobsbyrecuriterid(Long recuriterId){
		return jobRepository.findByRecruiter_Id(recuriterId);
	}
	           
	
	public Job getJobByIdAndRecruiter(
	        Long jobId, Long recruiterId) {

	    Job job = jobRepository.findById(jobId)
	            .orElseThrow(() ->
	                    new RuntimeException("Job not found"));

	    if (job.getRecruiter() == null
	            || !job.getRecruiter().getId().equals(recruiterId)) {

	        throw new RuntimeException(
	                "You are not allowed to access this job");
	    }

	    return job;
	}
	    
	
	
	@Transactional
	public Job updateJob(Long jobId,
			Long recruiterId,
			JobUpdateRequest request
			) {
		
	
	Job job=jobRepository.findById(jobId).orElseThrow(() -> new RuntimeException("Job not found with this id"));
	
	if(job.getRecruiter()== null || !job.getRecruiter().getId().equals(recruiterId)) {
		 throw new RuntimeException(
	                "You are not allowed to update this job");
	}
	
	job.setTitle(request.getTitle());
    job.setCompany(request.getCompany());
    job.setLocation(request.getLocation());
    job.setDescription(request.getDescription());
    job.setRequiredSkills(request.getRequiredSkills());
    job.setJobType(request.getJobType());

    return jobRepository.save(job);
	}
	
	
	public void deleteJob(Long jobId, Long recruiterId) {

	    Job job = jobRepository.findById(jobId)
	            .orElseThrow(() -> new RuntimeException("Job not found"));

	    // Make sure this recruiter owns the job
	    if (job.getRecruiter() == null
	            || !job.getRecruiter().getId().equals(recruiterId)) {

	        throw new RuntimeException(
	                "You are not allowed to delete this job");
	    }

	    jobRepository.delete(job);
	}
}
