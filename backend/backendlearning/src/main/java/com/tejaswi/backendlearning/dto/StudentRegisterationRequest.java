package com.tejaswi.backendlearning.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class StudentRegisterationRequest {

	@NotBlank(message="Name cannot be empty")
	private String name;
	
	
	@NotBlank(message="Email cannot be empty")
	@Email(message="Please enter a valid email")
	private String email;
	
	
	@NotBlank(message="Skill cannot be empty")
	private String skill;
	
	
	@NotBlank(message="password is required")
	@Size(min=8,message="Password must contain at least 8 characters")
	private String password;
	
	public StudentRegisterationRequest () {
    }


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getSkill() {
		return skill;
	}


	public void setSkill(String skill) {
		this.skill = skill;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
}
