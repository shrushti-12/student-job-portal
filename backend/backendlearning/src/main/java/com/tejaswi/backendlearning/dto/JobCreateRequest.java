package com.tejaswi.backendlearning.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class JobCreateRequest {

    @NotBlank(message = "Job title cannot be empty")
    private String title;

    @NotBlank(message = "Company cannot be empty")
    private String company;

    @NotBlank(message = "Location cannot be empty")
    private String location;

    @NotBlank(message = "Description cannot be empty")
    private String description;

    @NotBlank(message = "Required skills cannot be empty")
    private String requiredSkills;

    @NotBlank(message = "Job type cannot be empty")
    private String jobType;

    @NotNull(message = "Recruiter ID is required")
    private Long recruiterId;

    public JobCreateRequest() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRequiredSkills() {
        return requiredSkills;
    }

    public void setRequiredSkills(String requiredSkills) {
        this.requiredSkills = requiredSkills;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public Long getRecruiterId() {
        return recruiterId;
    }

    public void setRecruiterId(Long recruiterId) {
        this.recruiterId = recruiterId;
    }
}