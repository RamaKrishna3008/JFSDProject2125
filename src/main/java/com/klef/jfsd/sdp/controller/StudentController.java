package com.klef.jfsd.sdp.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.StudentCourseMapping;
import com.klef.jfsd.sdp.service.AdminService;
import com.klef.jfsd.sdp.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Student")
public class StudentController {
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AdminService adminService;

	

	@PostMapping("updatedetails")
	public ModelAndView updateStudentDetails(HttpServletRequest request,@RequestParam("profileImage") MultipartFile file) {
		ModelAndView mv = new ModelAndView();
		try {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String fatherName = request.getParameter("fatherName");
		String motherName = request.getParameter("motherName");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String status = "ACTIVE";
		String batch = request.getParameter("batch");
		String registarationStatus="Not Elgible";
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
		
		
		Student st = new Student(id, name, fatherName, motherName, contact, address, password, status,blob,batch,registarationStatus);
		
		if(studentService.updateStudent(st)) {
			 HttpSession session = request.getSession();
		        session.setAttribute("student", st);
			mv.setViewName("studenthome");
			
		}else {
			mv.setViewName("studentdetails");
			String error = "Please Enter all the details correctly";
			mv.addObject("error", error);
		}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mv;
	}

	@GetMapping("home")
	public ModelAndView StudentHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studenthome");
		return mv;
	}
	
	@GetMapping("details")
	public ModelAndView StudentDetails() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentdetails");
		return mv;
	}
	@GetMapping("profile")
	public ModelAndView StudentProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentprofile");
		return mv;
	}
	
	@GetMapping("Courses/Registration")
	public ModelAndView StudentCourseRegistartion(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("StudentCourseRegistartion");
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		
		String ay=request.getParameter("ay");
		String sem =request.getParameter("sem");
		
		
		if(student.getRegistarationStatus().equals("Elgible")) 
		{
			List<Course> fcmlist =  studentService.getSectionsForReg(student.getBatchname(),ay,sem);
			mv.addObject("fcm", fcmlist);
			for (Course fcm : fcmlist) {
				int id = fcm.getCourseid();
				System.out.println(fcm.getCourseid());
				mv.addObject("sections" + id, studentService.getSectionsForReg(id));
			}
		}
		else
		{
			mv.addObject("message","Not Eligible To Register Contact Admin");
		}
		
		return mv;
	}
	
	@PostMapping("Courses/Register")
	public ModelAndView CoursesRegister(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		int n = Integer.parseInt(request.getParameter("n"));
		
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		
		
		for(int i=1;i<=n;i++)
		{
			String sections = request.getParameter(Integer.toString(i));
			if(sections!=""&&sections!=null)
			{
				String[] parts = sections.split("/");
				int courseid=Integer.parseInt(parts[0]);
				int sec = Integer.parseInt(parts[1]);
				int fac = Integer.parseInt(parts[2]);
				
				long number = studentService.checkStudentCourseMapping(s.getId(), courseid, sec);
				
				
				
				
				if(number==0) 
				{
					Course c = adminService.displayCourseById(courseid);
					Faculty f = adminService.displayFacultyById(fac);
					StudentCourseMapping mapping = new StudentCourseMapping();
					mapping.setSection(sec);
					mapping.setCourse(c);
					mapping.setFaculty(f);
					mapping.setStudent(s);
					
					studentService.MapCourseToStudent(mapping);
				}
				
			}
			
		}
		
		mv.setViewName("studenthome");
		mv.addObject("message","Registered Successfully");
		return mv;
	}
	
	@GetMapping("ViewMyCoursesHome")
	public ModelAndView ViewMyCoursesHome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ViewMyCoursesHome");
		return mv;
	}
	
	@GetMapping("ViewMyCourses")
	public ModelAndView ViewMyCourses(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		String ay=request.getParameter("academicyear");
		String sem =request.getParameter("sem");
		mv.setViewName("ViewMyCoursesStudent");
		mv.addObject("sem", sem);
		mv.addObject("ay",ay);
		List<StudentCourseMapping> scm = studentService.viewStudentCourses(ay, sem);
		if(scm.isEmpty())
			mv.addObject("msg","No courses available ");
		else
			mv.addObject("scm",scm);
		return mv;
	}
	
	@GetMapping("ViewCourseMaterials")
	public ModelAndView ViewCourseMaterials(@RequestParam int cid,@RequestParam int section,@RequestParam String ay,@RequestParam String sem)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ViewCourseMaterials");
		mv.addObject("materials",studentService.ViewAllMaterials(cid, section));
		mv.addObject("sem", sem);
		mv.addObject("ay",ay);
		return mv;
	}
	
	@GetMapping("displaymaterialbyid")
	public ResponseEntity<byte[]> displaymaterialbyid(@RequestParam int id) throws Exception {
	    FacultyStudentCourseMaterials studentCourseMaterials = studentService.ViewMaterialById(id);
	    byte[] materialBytes = studentCourseMaterials.getMaterial().getBytes(1, (int) studentCourseMaterials.getMaterial().length());
	    
	    String filename = studentCourseMaterials.getFilename();

	    return ResponseEntity.ok()
	            .contentType(MediaType.APPLICATION_PDF)
	            .header(HttpHeaders.CONTENT_DISPOSITION, 
	                    "inline; filename=\"" + filename + "\"")
	            .body(materialBytes);
	}
	
	
	
}
