package com.tejaswi.backendlearning.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tejaswi.backendlearning.dto.LoginRequest;
import com.tejaswi.backendlearning.dto.StudentRegisterationRequest;
import com.tejaswi.backendlearning.dto.StudentRequest;
import com.tejaswi.backendlearning.dto.StudentResponse;
import com.tejaswi.backendlearning.entity.Student;
import com.tejaswi.backendlearning.service.StudentService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/students")
public class StudentController {
	
	private final StudentService studentService;
	public StudentController(StudentService studentService) {
		this.studentService=studentService;
	}
	
	@PostMapping
	public ResponseEntity<StudentResponse> register( @Valid @RequestBody StudentRegisterationRequest request) {
		
		Student savedstudent=studentService.register(request);
		StudentResponse response=new StudentResponse();
		
		 response.setId(savedstudent.getId());
		    response.setName(savedstudent.getName());
		    response.setEmail(savedstudent.getEmail());
		    response.setSkill(savedstudent.getSkill());

		
		
		return ResponseEntity.status(HttpStatus.CREATED)
				.body(response);
	}
	
	
	
	@PostMapping("/login")
	public ResponseEntity<StudentResponse> login(@Valid @RequestBody LoginRequest request){
		Student student=studentService.Login(request);
		
		StudentResponse response=new StudentResponse();
		response.setId(student.getId());
		response.setName(student.getName());
		response.setEmail(student.getEmail());
		response.setSkill(student.getSkill());
		return ResponseEntity.ok(response);
		
	}
	
	
	@GetMapping
	public List<Student> getallstudents(){
		
		
		return studentService.getallstudents();
	}
	
	
	@GetMapping("/{id}")
	public Student getstudentbyid(@PathVariable int id) {
		return studentService.getbyid(id);
	}
	
	@PutMapping("/{id}")
	public Student updatestudent(@PathVariable Integer id ,@Valid @RequestBody Student student) {
		return studentService.updateStudent(id, student);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable Integer id){
		studentService.deletestudent(id);
		return ResponseEntity.noContent().build();
	}

	
	
	
	
	
	
}
