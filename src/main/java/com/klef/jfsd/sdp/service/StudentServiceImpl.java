package com.klef.jfsd.sdp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.StudentCourseMapping;
import com.klef.jfsd.sdp.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.sdp.repository.FacultyStudentCourseMaterialsRepository;
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
	public String MapCourseToStudent(StudentCourseMapping mapping) 
	{
		studentCourseMappingRepository.save(mapping);
		return "Registered Successfully";
	}
	
	@Override
	public Long checkStudentCourseMapping(String stduentid,int courseid,int section) 
	{
		return studentCourseMappingRepository.checkStudentCourseMapping(stduentid, courseid, section);
	}
	
	@Override
	public List<StudentCourseMapping> viewStudentCourses(String academicYear,String offeredsem) 
	{
		return studentCourseMappingRepository.findStudentCourses(academicYear, offeredsem);
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
	
	
}
