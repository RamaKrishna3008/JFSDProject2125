package com.klef.jfsd.sdp.model;

import java.sql.Blob;
import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_table")
public class Student {

	@Id
	private String id;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false)
	private String fatherName;
	@Column(nullable = false)
	private String motherName;
	@Column(nullable = false, unique = true)
	private String contact;
	@Column(nullable = false)
	private String address;
	@Column(nullable = false)
	private String password;
	@Column(nullable = false)
	private String status;
	@Column(nullable = false)
	private String batchname;
	
	@Column(nullable = false)
	private String registarationStatus;

	@Column(name="student_pic",nullable = false)
	private Blob image;

		
	@CreationTimestamp
	@Column(name = "created_at", updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at")
	private LocalDateTime updatedAt;
	
	public String getId() {
		return id;
	}

	public String getBatchname() {
		return batchname;
	}

	public void setBatchname(String batchname) {
		this.batchname = batchname;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	

	public Student(String id, String name, String fatherName, String motherName, String contact, String address,
			String password, String status, Blob image,String batchname,String registarationStatus) {
		super();
		this.id = id;
		this.name = name;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.contact = contact;
		this.address = address;
		this.password = password;
		this.status = status;
		this.image = image;
		this.batchname=batchname;
		this.registarationStatus=registarationStatus;
	}

	public Student() {
		super();
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public String getRegistarationStatus() {
		return registarationStatus;
	}

	public void setRegistarationStatus(String registarationStatus) {
		this.registarationStatus = registarationStatus;
	}

}
