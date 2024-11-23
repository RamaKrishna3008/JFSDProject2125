package com.klef.jfsd.sdp.service;

import java.util.List;

import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.StudentCourseMapping;

public interface StudentService{
	public Student studentLogin(String id, String password);
	public boolean updateStudent(Student st);
	
	
	public List<Course> getCoursesForReg(String batch);
	public List<FacultyCourseMapping> getSectionsForReg(int id);
	public String MapCourseToStudent(StudentCourseMapping mapping);
	public Long checkStudentCourseMapping(String stduentid, int courseid, int section);
	public List<StudentCourseMapping> viewStudentCourses();
	public List<FacultyStudentCourseMaterials> ViewAllMaterials(int cid,int section);
	public FacultyStudentCourseMaterials ViewMaterialById(int id);
}
