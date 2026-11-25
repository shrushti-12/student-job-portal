package com.tejaswi.backendlearning.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.tejaswi.backendlearning.dto.ApplyJobRequest;
import com.tejaswi.backendlearning.entity.Job;
import com.tejaswi.backendlearning.entity.JobApplication;
import com.tejaswi.backendlearning.entity.Student;
import com.tejaswi.backendlearning.exception.ResourceNotFoundException;
import com.tejaswi.backendlearning.repository.JobApplicationRepository;
import com.tejaswi.backendlearning.repository.JobRepository;
import com.tejaswi.backendlearning.repository.StudentReposistoy;

import jakarta.transaction.Transactional;
@Service
public class JonApplicationService {
  
	
	private final JobApplicationRepository applicationRepository;
	private final StudentReposistoy studentReposistoy;
	private final JobRepository jobRepository;
	
	public JonApplicationService(JobApplicationRepository applicationRepository, StudentReposistoy studentReposistoy,JobRepository jobRepository) {
		this.applicationRepository=applicationRepository;
		this.studentReposistoy=studentReposistoy;
		this.jobRepository=jobRepository;
	}
	
	@Transactional
	public JobApplication applyforJob(ApplyJobRequest request) {
		Student student = studentReposistoy.findById(
		        request.getStudentid().intValue()
		)
				.orElseThrow(()->
				new ResourceNotFoundException("Student not found with this id"));
		
		
		
		Job job=jobRepository.findById(request.getJobid())
				.orElseThrow(()->
				new ResourceNotFoundException("Job not found with this id"));
		
		boolean alreadyapplied=applicationRepository.existsByStudent_IdAndJob_Id (
                (long)  student.getId(), job.getId());
		
		if(alreadyapplied) {
			throw new IllegalStateException("You have already applied for job");
		}
				
		
		JobApplication application=new JobApplication();
		application.setStudent(student);
		application.setJob(job);
		application.setAppliedAt(LocalDateTime.now());
		application.setStatus("Applied");
		
		return applicationRepository.save(application);
	}
	
	
	public List<JobApplication> getApplicationByStudent(Integer studentId){
		return applicationRepository.findByStudent_Id(studentId);
	}
	
	public List<JobApplication> getApplicationsByRecruiter(Long recruiterId) {
	    return applicationRepository.findByJob_Recruiter_Id(recruiterId);
	}
	
	public JobApplication updateApplicationStatus(
	        Long applicationId,
	        Long recruiterId,
	        String status) {

	    JobApplication application = applicationRepository.findById(applicationId)
	            .orElseThrow(() ->
	                    new ResourceNotFoundException(
	                            "Application not found with this id"));

	    Long applicationRecruiterId =
	            application.getJob().getRecruiter().getId();

	    if (!applicationRecruiterId.equals(recruiterId)) {
	        throw new IllegalStateException(
	                "You are not allowed to update this application");
	    }

	    application.setStatus(status);

	    return applicationRepository.save(application);
	}
}
