package com.tejaswi.backendlearning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tejaswi.backendlearning.entity.Job;

public interface JobRepository extends JpaRepository<Job, Long> {
	   List<Job> findByRecruiter_Id(Long recruiterId);
}
