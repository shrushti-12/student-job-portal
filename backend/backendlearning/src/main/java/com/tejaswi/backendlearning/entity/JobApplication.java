package com.tejaswi.backendlearning.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(name="job_applications",uniqueConstraints = {
        @UniqueConstraint(
                columnNames = {"student_id", "job_id"}
            )
        })
public class JobApplication {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	 Long id;
	
	@ManyToOne(optional = false)
	@JoinColumn(name="student_id",nullable = false)
	private Student student;
	
	
	@ManyToOne(optional = false)
	@JoinColumn(name="job_id",nullable = false)
	private Job job;
	
	
	private LocalDateTime appliedAt;
	private String status;
	
	public JobApplication() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public LocalDateTime getAppliedAt() {
		return appliedAt;
	}

	public void setAppliedAt(LocalDateTime appliedAt) {
		this.appliedAt = appliedAt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
