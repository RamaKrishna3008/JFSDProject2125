package com.klef.jfsd.sdp.service;

import java.util.List;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.Student;

public interface AdminService 
{
	public Admin checkAdminLogin(String username,String password);
	public String addFaculty(Faculty f);
	public List<Faculty> viewAllFaculty();
	public String updateFaculty(Faculty f);
	public String deleteFaculty(int fid);
	public Faculty viewFacultyById(int id);
	
	public String addStudent(Student s);
	public List<Student> viewAllStudents();
	public String updateStudent(Student s);
	public String deleteStudent(String sid);
	public Student viewStudentById(String id);
	public String updateStudentRegistration(String sid);
	
	
	
	
	//facultycoursemapping methods
	
	  public List<Course> displayAllCourses();
	  public String addcourse(Course c);
	  
	  public Faculty displayFacultyById(int fid);
	  public Course displayCourseById(int cid); 
	  
	  public String facultyCourseMapping(FacultyCourseMapping fcm);
	  public List<FacultyCourseMapping> displayFacultyCourseMapping();
	  
	  public long checkFacultyCourseMapping(Faculty f,Course c,int section);
	  
	
}
