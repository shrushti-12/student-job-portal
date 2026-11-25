package com.tejaswi.backendlearning.dto;

import jakarta.validation.constraints.NotNull;

public class ApplyJobRequest {
	
@NotNull(message="Studentid must not null")
  private Long studentid;
@NotNull(message="Jobid must not null")
  private Long jobid;
  public Long getStudentid() {
	return studentid;
  }
  public void setStudentid(Long studentid) {
	this.studentid = studentid;
  }
  public Long getJobid() {
	return jobid;
  }
  public void setJobid(Long jobid) {
	this.jobid = jobid;
  }
  
  
  
}
