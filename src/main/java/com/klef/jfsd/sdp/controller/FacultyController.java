package com.klef.jfsd.sdp.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.Comparator;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.StudentCourseMapping;
import com.klef.jfsd.sdp.service.AdminService;
import com.klef.jfsd.sdp.service.FacultyService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Faculty")
public class FacultyController 
{
	@Autowired
	FacultyService facultyService;
	
	@Autowired
	AdminService service;
	
	
	
	
	
	@GetMapping("/Home")
	public ModelAndView Facultyhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FacultyHome");
		return mv;
	}
	
	@GetMapping("/UpdateFacultyProfile")
	public ModelAndView UpdateFacultyProfile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UpdateFacultyProfile");
		return mv;
	}
	
	@PostMapping("UpdateProfile")
	public ModelAndView RegisterFaculty(HttpServletRequest request,@RequestParam("profileImage") MultipartFile file)
	{
		ModelAndView mv=new ModelAndView();
		try {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");
		String contact = request.getParameter("contactno");
		
		Faculty f=new Faculty();
		 Blob blob;
	        
	        if (file != null && !file.isEmpty()) {
	            byte[] bytes = file.getBytes();
	            blob = new SerialBlob(bytes);
	        } else {
	            // Load the default image file from server
	            Path defaultImagePath = Paths.get("src/main/webapp/images/default-profile-picture.jpg");
	            byte[] defaultImageBytes = Files.readAllBytes(defaultImagePath);
	            blob = new SerialBlob(defaultImageBytes);
	        }
		
		f.setId(id);
		f.setName(name);
		f.setUsername(username);
		f.setPassword(pwd);
		f.setEmail(email);
		f.setContactno(contact);
		f.setImage(blob);
		
		String msg = facultyService.UpdateFacultyProfile(f);
		HttpSession session = request.getSession();
		session.removeAttribute("faculty");
		session.setAttribute("faculty", f);
		mv.addObject("message",msg);
		mv.setViewName("redirect:/Faculty/UpdateFacultyProfile");
		} catch (Exception e) {
	        e.printStackTrace(); 
	    }
		return mv;
		
	}
	
	@GetMapping("viewFacultyMappedCoursesHome")
	public ModelAndView viewFacultyMappedCoursesHome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ViewFacultyMappedCoursesHome");
		return mv;
	}
	
	@GetMapping("viewFacultyMappedCourses")
	public ModelAndView viewFacultyMappedCourses(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewFacultyMappedCourses");
		
		String ay=request.getParameter("academicyear");
		String sem =request.getParameter("sem");
		HttpSession session = request.getSession(); 
		Faculty f = (Faculty)session.getAttribute("faculty");
		mv.addObject("fcmdata", facultyService.findFacultyCoursesAndSections(f.getId(),ay,sem));
		
		return mv;
		
	}
	
	@GetMapping("ViewStudents_Faculty")
	public ModelAndView ViewStudents_Faculty()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ViewStudents_Faculty");
		mv.addObject("studentlist", service.viewAllStudents());
		
		return mv;
		
	}
	
	@GetMapping("GetStudentsByCourses")
	public ModelAndView GetStudentsByCourses(@RequestParam int fid,@RequestParam int cid,@RequestParam int section)
	{
		ModelAndView mv = new ModelAndView();
		List<StudentCourseMapping> scm = facultyService.findStudentsByFacultyId(fid, cid, section);
		scm.sort(Comparator.comparing(mapping -> mapping.getStudent().getId()));
		mv.addObject("slist",scm);
		if(scm!=null) {
			mv.addObject("Course",scm.get(0).getCourse());
		}
		mv.setViewName("GetStudentsByCoursesFaculty");
		return mv;
	}
	
	@GetMapping("AddStudentInternals")
	public ModelAndView AddStudentInternals(@RequestParam int fid,@RequestParam int cid,@RequestParam int section)
	{
		ModelAndView mv = new ModelAndView();
		List<StudentCourseMapping> scm = facultyService.findStudentsByFacultyId(fid, cid, section);
		scm.sort(Comparator.comparing(mapping -> mapping.getStudent().getId()));
		mv.addObject("slist",scm);
		if(scm!=null) {
			mv.addObject("Course",scm.get(0).getCourse());
		}
		mv.setViewName("FacultyAddingStudentInternals");
		return mv;
	}
	
	@GetMapping("AddCourseMaterials")
	public ModelAndView AddCourseMaterials(@RequestParam int cid,@RequestParam int section)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("AddCourseMaterialsFaculty");
		mv.addObject("course", service.displayCourseById(cid));
		mv.addObject("section",section);
		return mv;
	}
	
	@PostMapping("AddingCourseMaterials")
	public ModelAndView AddingCourseMaterials(HttpServletRequest request,@RequestParam MultipartFile file)
	{
		ModelAndView mv=new ModelAndView();
		try {
		int cid = Integer.parseInt(request.getParameter("cid"));
		int section = Integer.parseInt(request.getParameter("section"));
		String filename = request.getParameter("filename");
		
	            byte[] bytes = file.getBytes();
	            Blob blob = new SerialBlob(bytes);
		
		FacultyStudentCourseMaterials materials = new FacultyStudentCourseMaterials();
		materials.setCid(cid);
		materials.setSection(section);
		materials.setMaterial(blob);
		materials.setFilename(filename);
		
		facultyService.AddMaterials(materials);
		mv.setViewName("MaterialAddedSuccess");
		mv.addObject("message","success");
		} catch (Exception e) {
	        e.printStackTrace();
	    }
		return mv;
		
	}

	
	@GetMapping("/SessionExpiry")
	public ModelAndView SessionExpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Faculty_sessionexpiry");
		return mv;
	}
	
}
