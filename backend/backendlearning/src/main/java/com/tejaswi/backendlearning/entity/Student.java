package com.tejaswi.backendlearning.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
//import jakarta.persistence.Entity;
import jakarta.validation.constraints.NotBlank;
@Entity
@Table(name="students")
public class Student {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)

private int id;

@Lob
@Column(name = "resume")
private byte[] resume;

@Column(name = "resume_name")
private String resumeName;
@NotBlank(message="name cannot be empty")
private String name;
@NotBlank(message="email cannot be empty")
@Column(unique=true,nullable =false )
private String email;


@NotBlank(message="skill cannot be empty")
private String skill;

@NotBlank(message="password cannot be empty")
@Column(nullable=false)
private String password;


public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public Student() {
	
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSkill() {
	return skill;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public void setSkill(String skill) {
	this.skill = skill;
}


public byte[] getResume() {
	return resume;
}
public void setResume(byte[] resume) {
	this.resume = resume;
}
public String getResumeName() {
	return resumeName;
}
public void setResumeName(String resumeName) {
	this.resumeName = resumeName;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
}
