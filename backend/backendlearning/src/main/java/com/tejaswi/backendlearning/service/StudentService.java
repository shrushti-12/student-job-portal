package com.tejaswi.backendlearning.service;



import java.util.List;


import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;

import com.tejaswi.backendlearning.dto.LoginRequest;
import com.tejaswi.backendlearning.dto.StudentRegisterationRequest;
import com.tejaswi.backendlearning.dto.StudentRequest;
import com.tejaswi.backendlearning.dto.StudentResponse;
import com.tejaswi.backendlearning.entity.Student;
import com.tejaswi.backendlearning.exception.StudentNotFoundException;
import com.tejaswi.backendlearning.repository.StudentReposistoy;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.server.ResponseStatusException;
@Service
public class StudentService {
	private final StudentReposistoy studentReposistoy;
	private final PasswordEncoder passwordEncoder;
	public StudentService(StudentReposistoy studentReposistoy, PasswordEncoder passwordEncoder) {
		this.studentReposistoy=studentReposistoy;
		this.passwordEncoder=passwordEncoder;
	}
	
	
	public Student register(StudentRegisterationRequest request) {
		
		
		String email=request.getEmail().trim();
		if(studentReposistoy.existsByEmail(email)) {
			throw new ResponseStatusException(HttpStatus.CONFLICT,"This email already exist");
		}
		Student student=new Student();
		
		student.setName(request.getName().trim());
		student.setEmail(email);
		student.setSkill(request.getSkill().trim());
		
		student.setPassword(passwordEncoder.encode(request.getPassword()));
		return studentReposistoy.save(student);
	}
	
	
	public Student Login(LoginRequest request) {
		String email=request.getEmail().trim();
		Student student=studentReposistoy.findByEmail(email)
				.orElseThrow(()->
				new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Invalid email or password"));
		
		
		if(!passwordEncoder.matches(request.getPassword(), student.getPassword())) {
			throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Invalid student or password");
			
			
			
		}
		return student;		
				
				
		
	}

	public List<Student> getallstudents(){
		return studentReposistoy.findAll();
	}
	
	public Student getbyid(int id) {
	return studentReposistoy.findById(id)
	.orElseThrow(()->
	new ResponseStatusException(
            HttpStatus.NOT_FOUND,
            "Student not found with id: " + id));
	}
	
	
	public Student updateStudent(Integer id, Student updatedstudent) {
		Student existingstudent=studentReposistoy.findById(id)
				.orElseThrow(()->
				new ResponseStatusException(
	                    HttpStatus.NOT_FOUND,
	                    "Student not found with id: " + id));
		
		
		existingstudent.setName(updatedstudent.getName());
		existingstudent.setEmail(updatedstudent.getEmail());
		existingstudent.setSkill(updatedstudent.getSkill());
		
		return studentReposistoy.save(existingstudent);
	}

	
public void deletestudent(Integer id) {
	Student student=studentReposistoy.findById(id)
			.orElseThrow(()->
			new ResponseStatusException(
                    HttpStatus.NOT_FOUND,
                    "Student not found with id: " + id));
	
	          studentReposistoy.delete(student);
}
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
