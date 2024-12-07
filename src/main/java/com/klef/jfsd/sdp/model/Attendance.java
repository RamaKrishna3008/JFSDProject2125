package com.klef.jfsd.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "attendance_table")
public class Attendance 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	 @ManyToOne
	  @JoinColumn(name = "student_id") 
	  private Student student;
	
	 @ManyToOne
	 @JoinColumn(name = "course_id") 
	 private Course course;
	
	@Column(nullable = false)
	private int section;
	
	@Column(nullable = false)
	private String Date;
	
	@Column(nullable = false)
	private int hour;
	
	@Column(nullable = false)
	private boolean present;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	

	public boolean isPresent() {
		return present;
	}

	public void setPresent(boolean present) {
		this.present = present;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}
}
