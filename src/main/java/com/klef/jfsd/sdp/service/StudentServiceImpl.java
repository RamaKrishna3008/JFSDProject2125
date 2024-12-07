package com.klef.jfsd.sdp.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.Feedback;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.StudentCourseMapping;
import com.klef.jfsd.sdp.repository.AttendanceRepository;
import com.klef.jfsd.sdp.repository.CourseRepository;
import com.klef.jfsd.sdp.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.sdp.repository.FacultyRepository;
import com.klef.jfsd.sdp.repository.FacultyStudentCourseMaterialsRepository;
import com.klef.jfsd.sdp.repository.FeedbackRepository;
import com.klef.jfsd.sdp.repository.StudentCourseMappingRepository;
import com.klef.jfsd.sdp.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	FacultyCourseMappingRepository facultyCourseMappingRepository;
	
	@Autowired
	StudentCourseMappingRepository studentCourseMappingRepository;
	
	@Autowired
	FacultyStudentCourseMaterialsRepository materialsRepository;
	
	@Autowired
	CourseRepository courseRepository;
	
	@Autowired
	FacultyRepository facultyRepository;
	
	@Autowired
	AttendanceRepository attendanceRepository;
	
	@Autowired
    private FeedbackRepository feedbackRepository;

	
	@Override
	public Student studentLogin(String id, String password) {
		
		Optional<Student> obj =	studentRepository.findById(id);
		if(obj.isPresent()) {
			Student st = obj.get();
			if(st.getPassword().equals(password)) {
				return st;
			}
		}
		return null;
	}
	
	@Override
	public boolean updateStudent(Student st) {
		if(studentRepository.save(st)!=null)
			return true;
		else
			return false;
	}

	@Override
	public List<Course> getSectionsForReg(String batch,String ay,String sem) 
	{
		return facultyCourseMappingRepository.getSectionsForReg(batch, ay, sem);
	}
	
	
	@Override
	public List<FacultyCourseMapping> getSectionsForReg(int id) 
	{
		return facultyCourseMappingRepository.findSectionByCourseId(id);
	}
	
	@Override
	public void removeCapacity(int courseid,int fid,int section) 
	{
		FacultyCourseMapping fcm = facultyCourseMappingRepository.getListForCapacity(courseid, fid, section);
		fcm.setCapacity(fcm.getCapacity()-1);
		facultyCourseMappingRepository.save(fcm);
	}
	
	
	@Override
	public String MapCoursesToStudent(Map<Integer, StudentCourseMapping> mappings) {
	    try {
	        studentCourseMappingRepository.saveAll(mappings.values());
	        return "All courses registered successfully";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "Error while registering courses";
	    }
	}

	
	@Override
	public Long checkStudentCourseMapping(String stduentid,int courseid) 
	{
		return studentCourseMappingRepository.checkStudentCourseMapping(stduentid, courseid);
	}
	
	@Override
	public List<StudentCourseMapping> viewStudentCourses(String academicYear,String offeredsem,Student s) 
	{
		return studentCourseMappingRepository.findStudentCourses(academicYear, offeredsem,s);
	}
	
	@Override
	public FacultyStudentCourseMaterials ViewMaterialById(int id) 
	{
		return materialsRepository.findById(id).get();
	}
	
	@Override
	public List<FacultyStudentCourseMaterials> ViewAllMaterials(int cid,int section) 
	{
		return materialsRepository.findByCidAndSection(cid,section);
	}
	
	@Override
	public int findSectionByCourseAndStudent(Course course, Student student)
	{
		 Integer section = attendanceRepository.findSectionsByCourseAndStudent(course, student);
		    return (section != null) ? section : -1; 
	}
	
	@Override
	public int getStudentAttedance(Course course, Student student,int section)
	{
		long t = attendanceRepository.countByCourseAndSection(course, section);
		
		long p = attendanceRepository.countByStudentAndCourseAndPresentTrue(student, course);
		
		return (int) (((double)p/t)*100);
		
	}
	
	@Override
	public  List<Course> viewCourseBySem(String ay,String sem) {
		return courseRepository.findByAcademicYearAndOfferedsem(ay, sem);
	}
	
	@Override
	public Course displayCourseById(int cid) {
		return courseRepository.findById(cid).get();
	}
	
	@Override
	public Faculty displayFacultyById(int fid) {
		return facultyRepository.findById(fid).get();
	}
	
	@Override
	public List<StudentCourseMapping> MyCGPA(String sid) {
		return studentCourseMappingRepository.MyCourses(sid);
	}
	
	
	@Override
	public String updateGrade(float grade,String sid) 
	{
		studentRepository.updatestudentgrade(grade,sid);
		return "Updated SuccessFully";
	}
	
	@Override
	public Student viewStudentById(String id) {
		return studentRepository.findById(id)
				.orElse(null);
	}
	
	@Override
	public void saveFeedback(Feedback feedback) {
        feedbackRepository.save(feedback);
    }
	
	@Override
	public long countCourseIdAndStudentId(int cid,String sid) {
		return feedbackRepository.countByCourseIdAndStudentId(cid, sid);
    }
	@Override
	  public long getRegisteredCoursesCount(Student s) 
	  {
	    
	    return studentCourseMappingRepository.countByStudent(s);
	  }
	
	@Override
	  public List<StudentCourseMapping> ViewAllCourses(Student s) 
	  {
	    
	    return studentCourseMappingRepository.findByStudent(s);
	  }
}
