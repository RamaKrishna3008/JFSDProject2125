package com.klef.jfsd.sdp.model;


import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "faculty_table")
public class Faculty
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "fname",length = 50,nullable = false)
	private String name;
	@Column(name = "fusername",length = 30,nullable = false,unique = true)
	private String username;
	@Column(name = "fpassword",length = 30,nullable = false)
	private String password;
	@Column(name = "femail",length = 50,nullable = false,unique = true)
	private String email;
	@Column(name = "fcontact",length = 20,nullable = false,unique = true)
	private String contactno;
	
	@Column(name="fstatus",length=20,nullable=false)
	private String active;
	
	@Column(name="faculty_pic",nullable = false)
	private Blob image;
	
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	
}
