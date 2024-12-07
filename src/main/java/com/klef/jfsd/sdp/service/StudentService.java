package com.klef.jfsd.sdp.service;

import java.util.List;

import java.util.Map;

import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.Feedback;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.StudentCourseMapping;

public interface StudentService{
	public Student studentLogin(String id, String password);
	public boolean updateStudent(Student st);
	
	
	public List<Course> getSectionsForReg(String batch,String ay,String sem);
	public List<FacultyCourseMapping> getSectionsForReg(int id);
	public String MapCoursesToStudent(Map<Integer, StudentCourseMapping> mappings);
	public Long checkStudentCourseMapping(String stduentid, int courseid);
	public List<StudentCourseMapping> viewStudentCourses(String academicYear, String offeredsem, Student s);
	public List<FacultyStudentCourseMaterials> ViewAllMaterials(int cid,int section);
	public FacultyStudentCourseMaterials ViewMaterialById(int id);
	public int findSectionByCourseAndStudent(Course course, Student student);
	public int getStudentAttedance(Course course, Student student, int section);
	public void removeCapacity(int courseid, int fid, int section);
	public List<Course> viewCourseBySem(String ay, String sem);
	public Course displayCourseById(int cid);
	public Faculty displayFacultyById(int fid);
	public List<StudentCourseMapping> MyCGPA(String sid);
	public String updateGrade(float grade, String sid);
	public Student viewStudentById(String id);
	public void saveFeedback(Feedback feedback);
	public long countCourseIdAndStudentId(int cid, String sid);
	public long getRegisteredCoursesCount(Student s);
	public List<StudentCourseMapping> ViewAllCourses(Student s);
}
