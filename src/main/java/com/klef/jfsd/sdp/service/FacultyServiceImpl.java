package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.StudentCourseMapping;
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
	
	
	
	@Override
	public Faculty CheckFacultyLogin(String username, String pwd) 
	{
		return facultyRepository.CheckFacultyLogin(username, pwd);
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




}
