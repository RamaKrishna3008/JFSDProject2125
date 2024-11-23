package com.klef.jfsd.sdp.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "studentcoursemapping_table")
public class StudentCourseMapping 
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
	
	 @ManyToOne
	 @JoinColumn(name = "faculty_id") 
	 private Faculty faculty;
	
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
	public Faculty getFaculty() {
		return faculty;
	}
	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}
	
	
	
}
