package com.tejaswi.backendlearning.dto;

public class StudentResponse {
	private int id;
	private String name;
	private String skill;
	private String level;
	private String email;
	 
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public StudentResponse() {
		
	}

	public StudentResponse(int id, String name, String skill, String level,String email) {
		
		this.id = id;
		this.name = name;
		this.skill = skill;
		this.level = level;
		this.email=email;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getSkill() {
		return skill;
	}

	public String getLevel() {
		return level;
	}
	
	

}
