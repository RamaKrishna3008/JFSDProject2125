package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.repository.AdminRepository;
import com.klef.jfsd.sdp.repository.CourseRepository;
import com.klef.jfsd.sdp.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.sdp.repository.FacultyRepository;
import com.klef.jfsd.sdp.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	AdminRepository adminRepository;
	
	@Autowired
	FacultyRepository facultyRepository;
	
	@Autowired
	StudentRepository studentRepository;
	
	@Autowired
	CourseRepository courseRepository;
	
	@Autowired
	FacultyCourseMappingRepository facultyCourseMappingRepository;
	
	@Override
	public Admin checkAdminLogin(String username, String password) 
	{
		return adminRepository.checkAdminLogin(username, password);
	}
	
	@Override
	public String addFaculty(Faculty f) 
	{
		facultyRepository.save(f);
		return "Registered Successfully";
	}

	@Override
	public List<Faculty> viewAllFaculty() 
	{
		return facultyRepository.findAll();
	}

	@Override
	public String addStudent(Student s) 
	{
		studentRepository.save(s);
		return "Registered Successfully";
	}

	@Override
	public List<Student> viewAllStudents()
	{
		return studentRepository.findAll();
	}

	@Override
	public String updateFaculty(Faculty f) 
	{
		Faculty fac = facultyRepository.findById(f.getId()).get();
		fac.setId(f.getId());
		fac.setName(f.getName());
		fac.setPassword(f.getPassword());
		fac.setEmail(f.getEmail());
		fac.setImage(f.getImage());
		fac.setActive(f.getActive());
		
		facultyRepository.save(fac);
		return "Updated Successfully";
	}

	@Override
	public String deleteFaculty(int fid) {
		facultyRepository.updatefacultystatus("NA",fid);
		return "Deleted SuccessFully";
	}

	@Override
	public Faculty viewFacultyById(int id) {
		return facultyRepository.findById(id).get();
	}

	@Override
	public String updateStudent(Student s) {
		Student std = studentRepository.findById(s.getId()).get();
		std.setName(s.getName());
		std.setPassword(s.getPassword());
		std.setAddress(s.getAddress());
		std.setFatherName(s.getFatherName());
		std.setMotherName(s.getMotherName());
		std.setContact(s.getContact());
		std.setImage(s.getImage());
		std.setStatus(s.getStatus());
		
		
		studentRepository.save(std);
		return "Updated Successfully";
	}

	@Override
	public String deleteStudent(String sid) 
	{
		studentRepository.updatestudentstatus("NA",sid);
		return "Deleted SuccessFully";
	}
	@Override
	public String updateStudentRegistration(String sid) 
	{
		Student std = studentRepository.findById(sid).get();
		String status;
		if(std.getRegistarationStatus().equals("Not Elgible"))
		{
			status="Elgible";
		}
		else
		{
			status="Not Elgible";
		}
		studentRepository.updateregistationstudentstatus(status,sid);
		return "Updated SuccessFully";
	}

	@Override
	public Student viewStudentById(String id) {
		return studentRepository.findById(id).get();
	}

	@Override
	public List<Course> displayAllCourses() {
		return  courseRepository.findAll();
	}

	@Override
	public Faculty displayFacultyById(int fid) {
		return facultyRepository.findById(fid).get();
	}

	@Override
	public Course displayCourseById(int cid) {
		return courseRepository.findById(cid).get();
	}

	@Override
	public String facultyCourseMapping(FacultyCourseMapping fcm) {
		facultyCourseMappingRepository.save(fcm);
		return "Faculty Course Mapping Done";
	}

	@Override
	public List<FacultyCourseMapping> displayFacultyCourseMapping() {
		return (List<FacultyCourseMapping>) facultyCourseMappingRepository.findAll();
	}

	@Override
	public long checkFacultyCourseMapping(Faculty f, Course c, int section) {
		return facultyCourseMappingRepository.checkfcoursemapping(f, c, section);
	}

	
	public String addcourse(Course c) {
		courseRepository.save(c);
		return "Course Added Successfully";
	}
}
