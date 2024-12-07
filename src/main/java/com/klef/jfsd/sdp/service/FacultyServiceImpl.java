package com.klef.jfsd.sdp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Attendance;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.StudentCourseMapping;
import com.klef.jfsd.sdp.repository.AttendanceRepository;
import com.klef.jfsd.sdp.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.sdp.repository.FacultyRepository;
import com.klef.jfsd.sdp.repository.FacultyStudentCourseMaterialsRepository;
import com.klef.jfsd.sdp.repository.StudentCourseMappingRepository;

@Service
public class FacultyServiceImpl implements FacultyService
{
	
	@Autowired
	FacultyRepository facultyRepository;
	
	@Autowired
	FacultyCourseMappingRepository facultyCourseMappingRepository;
	
	@Autowired
	StudentCourseMappingRepository studentCourseMappingRepository;
	
	@Autowired
	FacultyStudentCourseMaterialsRepository materialsRepository;
	
	@Autowired
	AttendanceRepository attendanceRepository;
	
	
	
	@Override
	public Faculty CheckFacultyLogin(String username, String pwd) 
	{
		return facultyRepository.CheckFacultyLogin(username, pwd);
	}

	@Override
	public Faculty viewFacultyByUsername(String username) {
		 return facultyRepository.findByUsername(username)
			        .orElse(null);
	}


	@Override
	public String UpdateFacultyProfile(Faculty f) 
	{
		Faculty faculty = facultyRepository.findById(f.getId()).get();
		
		faculty.setName(f.getName());
		faculty.setEmail(f.getEmail());
		faculty.setContactno(f.getContactno());
		faculty.setImage(f.getImage());
		faculty.setPassword(f.getPassword());
		
		facultyRepository.save(faculty);
		
		return "Updated Successfully";
	}
	
	@Override
	public List<FacultyCourseMapping> findFacultyCoursesAndSections(int fid,String acadmicYear,String offeredsem)
	{
		return facultyCourseMappingRepository.findCourseAndSectionByFacultyIdAndAYAndSem(fid, acadmicYear, offeredsem);
	}
	
	@Override
	public List<StudentCourseMapping> findStudentsByFacultyId(int fid,int cid,int section)
	{
		return studentCourseMappingRepository.findCourseAndSectionByFacultyId(fid, cid, section);
	}

	
	@Override
	public String AddMaterials(FacultyStudentCourseMaterials materials)
	{
		materialsRepository.save(materials);
		return "Material Added Successfully";
	}
	
	@Override
	public StudentCourseMapping findSCMById(int id)
	{
		return studentCourseMappingRepository.findById(id).get();
	}
	
	@Override
	public String UpdateInternals(StudentCourseMapping scm) {
	    	StudentCourseMapping mapping = studentCourseMappingRepository.findById(scm.getId()).get();
	        mapping.setStudentInternals(scm.getStudentInternals());
	        studentCourseMappingRepository.save(mapping);
	        return "Added Successfully";
	    
	}

	
	@Override
	public String PostAttendance(Map<Integer, Attendance> att)
	{
		try {
			attendanceRepository.saveAll(att.values());
			return "Attendance Posted Successfully";
		}
		catch (Exception e) {
	        e.printStackTrace();
	        return "Error while posting Attendance";
	    }
		
	}




}
