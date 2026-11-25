package com.tejaswi.backendlearning.dto;

import jakarta.validation.constraints.NotBlank;

public class StudentRequest {
	@NotBlank(message="Name cannot be empty")
	private String name;
	@NotBlank(message="Skill cannot be empty")
	private String skill;
	@NotBlank(message="Level cannot be empty")
	private String level;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	
	

}
