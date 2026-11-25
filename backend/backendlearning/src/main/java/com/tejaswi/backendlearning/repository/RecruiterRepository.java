package com.tejaswi.backendlearning.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tejaswi.backendlearning.entity.Recruiter;

public interface RecruiterRepository extends JpaRepository<Recruiter, Long> {
	boolean existsByEmail(String email);
	
	Optional<Recruiter> findByemail(String email);

}
