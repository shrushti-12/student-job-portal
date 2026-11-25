package com.tejaswi.backendlearning.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public class RecruiterLoginRequest {
	@NotBlank(message="Email cannot be empry")
	@Email(message="Enter a valid email")
	private String email;
	
	
	@NotBlank(message="Password cannot be empty")
	private String password;
	
	public RecruiterLoginRequest() {
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	

}
