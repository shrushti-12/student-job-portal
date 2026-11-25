package com.tejaswi.backendlearning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tejaswi.backendlearning.entity.JobApplication;

public interface JobApplicationRepository extends JpaRepository<JobApplication, Long> {
	
	boolean existsByStudent_IdAndJob_Id(Long studentId,Long jobId);

	
	List<JobApplication> findByStudent_Id(Integer studentId);
	List<JobApplication> findByJob_Recruiter_Id(Long recruiterId);
}
