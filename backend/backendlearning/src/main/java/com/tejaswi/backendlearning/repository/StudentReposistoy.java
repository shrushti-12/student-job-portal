package com.tejaswi.backendlearning.repository;

import java.util.Optional;

//import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tejaswi.backendlearning.entity.Student;

public interface StudentReposistoy extends JpaRepository<Student, Integer> {

	boolean existsByEmail(String email);
	
	Optional<Student> findByEmail(String email);
	// List<Student> findBySkillIgnoreCase(String skill,String level);
}
