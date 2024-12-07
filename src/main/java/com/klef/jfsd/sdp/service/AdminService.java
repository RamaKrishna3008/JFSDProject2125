package com.klef.jfsd.sdp.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.StudentCourseMapping;

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
	
	  public List<Course> viewCourseBySem(String ay, String sem);
	  public List<Course> displayAllCourses();
	  public String addcourse(Course c);
	  
	  public Faculty displayFacultyById(int fid);
	  public Course displayCourseById(int cid); 
	  
	  public String facultyCourseMapping(FacultyCourseMapping fcm);
	  public List<FacultyCourseMapping> displayFacultyCourseMapping();
	  
	  public long checkFacultyCourseMapping(Faculty f,Course c,int section);
	  
	  public List<StudentCourseMapping> getStudentsByCourses(String academicYear, String offeredsem, int cid);
	  public StudentCourseMapping findSCMById(int id);
	  public String UpdateExternals(StudentCourseMapping scm);
	public Map<String, Map<String, Integer>> getFeedbackSummary(int facultyId, int courseId) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, SecurityException;
	public long CourseCount();
	public long FacultyCount();
	public long StudentCount();
	
	  
	
}
