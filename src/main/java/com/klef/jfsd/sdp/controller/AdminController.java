package com.klef.jfsd.sdp.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("Admin")
public class AdminController 
{
	@Autowired
	AdminService service;
	
	
	@GetMapping("Home")
	public ModelAndView AdminHome()
	{
		ModelAndView mv= new ModelAndView("AdminHome");
		return mv;
	}
	
	
	@GetMapping("/facultyregistration")
	public ModelAndView registration()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FacultyRegistration");
		return mv;
	}
	
	@PostMapping("RegisterFaculty")
	public ModelAndView RegisterFaculty(HttpServletRequest request,@RequestParam("profileImage") MultipartFile file)
	{
		ModelAndView mv=new ModelAndView();
		try {
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");
		String contact = request.getParameter("contactno");
		
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
		
		Faculty f=new Faculty();
		f.setName(name);
		f.setUsername(username);
		f.setPassword(pwd);
		f.setEmail(email);
		f.setContactno(contact);
		f.setImage(blob);
		f.setActive("ACTIVE");
		
		service.addFaculty(f);
		mv.setViewName("redirect:/Admin/facultyregistration");
		mv.addObject("message","success");
		} catch (Exception e) {
	        e.printStackTrace();
	    }
		return mv;
		
	}
	
	
	@GetMapping("/studentregistration")
	public ModelAndView studentregistartion()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("StudentRegistration");
		return mv;
	}
	
	
	

	@PostMapping("RegisterStudent")
	public ModelAndView RegisterStudent(HttpServletRequest request, @RequestParam("profileImage") MultipartFile file) 
	{
	    ModelAndView mv = new ModelAndView();
	    try {
	        String id = request.getParameter("idno");
	        String name = request.getParameter("name");
	        String fathername = request.getParameter("fathername");
	        String mothername = request.getParameter("mothername");
	        String pwd = request.getParameter("password");
	        String address = request.getParameter("address");
	        String contact = request.getParameter("contactno");
	        String acemdemicyear = request.getParameter("ay").toUpperCase();
	        
	        Blob blob;
	        
	        if (file != null && !file.isEmpty()) {
	            byte[] bytes = file.getBytes();
	            blob = new SerialBlob(bytes);
	        } 
	        else 
	        {
	            Path defaultImagePath = Paths.get("src/main/webapp/images/default-profile-picture.jpg");
	            byte[] defaultImageBytes = Files.readAllBytes(defaultImagePath);
	            blob = new SerialBlob(defaultImageBytes);
	        }

	        Student s = new Student();
	        s.setId(id);
	        s.setName(name);
	        s.setFatherName(fathername);
	        s.setMotherName(mothername);
	        s.setPassword(pwd);
	        s.setAddress(address);
	        s.setContact(contact);
	        s.setImage(blob);
	        s.setStatus("NC");
	        s.setBatchname(acemdemicyear);
	        s.setRegistarationStatus("Not Elgible");
	        
	        String msg = service.addStudent(s);
	        
	        mv.setViewName("redirect:/Admin/studentregistration");
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return mv;
	}


	
	@GetMapping("ViewAllFaculty")
	public ModelAndView ViewAllFaculty()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ViewAllFaculty");
		mv.addObject("facultylist",service.viewAllFaculty());
		return mv;
	}
	
	@GetMapping("displayfacultyimage")
	public ResponseEntity<byte[]> displayfacultyimage(@RequestParam int id) throws Exception
	{
	  Faculty faculty =  service.viewFacultyById(id);
	  byte [] imageBytes = null;
	  imageBytes = faculty.getImage().getBytes(1,(int) faculty.getImage().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	  
	}
	
	@GetMapping("UpdateFaculty")
	public ModelAndView UpdateFaculty(@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView("UpdateFaculty");
		mv.addObject("faculty",service.viewFacultyById(id));
		return mv;
	}
	
	@PostMapping("UpdatingFaculty")
	public ModelAndView UpdatingFaculty(HttpServletRequest request,@RequestParam("profileImage") MultipartFile file)
	{
		
		ModelAndView mv=new ModelAndView();
		try {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");
		String contact = request.getParameter("contactno");
		String active = request.getParameter("status");
		
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
		
		Faculty f=new Faculty();
		f.setId(id);
		f.setName(name);
		f.setUsername(username);
		f.setPassword(pwd);
		f.setEmail(email);
		f.setContactno(contact);
		f.setImage(blob);
		f.setActive(active);
		
		String msg = service.updateFaculty(f);
		mv.addObject("message",msg);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		mv.setViewName("redirect:/Admin/ViewAllFaculty");
		
		
		return mv;
		
	}
	
	@GetMapping("DeleteFaculty")
	public ModelAndView DeleteFaculty(@RequestParam int id)
	{
		String msg = service.deleteFaculty(id);
		ModelAndView mv = new ModelAndView("redirect:/Admin/ViewAllFaculty");
		mv.addObject("message",msg);
		return mv;
	}
	
	@GetMapping("ViewFacultyById")
	public ModelAndView ViewFacultyById(@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView("ViewFacultyById");
		mv.addObject("faculty",service.viewFacultyById(id));
		return mv;
	}
	
	@GetMapping("ViewAllStudent")
	public ModelAndView ViewAllStudent()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ViewAllStudents");
		mv.addObject("studentlist",service.viewAllStudents());
		return mv;
	}
	
	@GetMapping("displaystudentimage")
	public ResponseEntity<byte[]> displaystudentimage(@RequestParam String id) throws Exception
	{
	  Student student =  service.viewStudentById(id);
	  byte [] imageBytes = null;
	  imageBytes = student.getImage().getBytes(1,(int) student.getImage().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	  
	}
	
	@GetMapping("UpdateStudent")
	public ModelAndView UpdateStudent(@RequestParam String id)
	{
		ModelAndView mv = new ModelAndView("UpdateStudent");
		mv.addObject("student",service.viewStudentById(id));
		return mv;
	}
	
	@PostMapping("UpdatingStudent")
	public ModelAndView UpdatingStudent(HttpServletRequest request,@RequestParam("profileImage") MultipartFile file)
	{
		ModelAndView mv=new ModelAndView();
		try {
		String id = request.getParameter("idno");
		String name = request.getParameter("name");
		String fathername = request.getParameter("fathername");
		String mothername = request.getParameter("mothername");
		String pwd = request.getParameter("password");
		String address = request.getParameter("address");
		String contact = request.getParameter("contactno");
		String status = request.getParameter("status");
		String acemdemicyear = request.getParameter("ay").toLowerCase();
		
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
		
		Student s=new Student();
		s.setId(id);
		s.setName(name);
		s.setFatherName(fathername);
		s.setMotherName(mothername);
		s.setPassword(pwd);
		s.setAddress(address);
		s.setContact(contact);
		s.setStatus(status);
		s.setImage(blob);
		s.setBatchname(acemdemicyear);
		
		String msg = service.updateStudent(s);
		
		mv.setViewName("redirect:/Admin/ViewAllStudent");
		mv.addObject("message",msg);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mv;
		
	}
	
	@GetMapping("DeleteStudent")
	public ModelAndView DeleteStudent(@RequestParam String id)
	{
		String msg = service.deleteStudent(id);
		ModelAndView mv = new ModelAndView("redirect:/Admin/ViewAllStudent");
		mv.addObject("message",msg);
		return mv;
	}
	
	@GetMapping("UpdateStudentRegistartionStatus")
	public ModelAndView UpdateStudentRegistartionStatus(@RequestParam String id)
	{
		String msg = service.updateStudentRegistration(id);
		ModelAndView mv = new ModelAndView("redirect:/Admin/ViewAllStudent");
		mv.addObject("message",msg);
		return mv;
	}
	
	@GetMapping("ViewStudentById")
	public ModelAndView ViewStudentById(@RequestParam String id)
	{
		ModelAndView mv = new ModelAndView("ViewStudentById");
		mv.addObject("student",service.viewStudentById(id));
		return mv;
	}

	
	

	//view all courses
	@GetMapping("viewallcourses")
	  public ModelAndView viewcoures(Model model)
	  {
		  ModelAndView mv = new ModelAndView("viewallcourses");
		 
		  model.addAttribute("coursedata", service.displayAllCourses());
		  
		  return mv;
	  }
	
	
	@GetMapping("/addcourse")
	public ModelAndView courseregistartion()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addcourse");
		return mv;
	}
	
	
	@PostMapping("insertcourse")
    public ModelAndView insertemp(HttpServletRequest request)
    {
     
     
	
    String ForBatch = request.getParameter("ForBatch"); 
     String coursecode = request.getParameter("coursecode");
     String coursetitle = request.getParameter("coursetitle");
     String ltps = request.getParameter("ltps");
     int credits = Integer.parseInt(request.getParameter("credits"));
     
       Course course = new Course();
       course.setCoursecode(coursecode);
       course.setCoursetitle(coursetitle);
       course.setLtps(ltps);
       course.setCredits(credits);
       course.setForBatch(ForBatch);
       
       String msg = service.addcourse(course);
       
       ModelAndView mv = new ModelAndView("courseregsuccess");
       mv.addObject("message", msg);
     
       return mv;
    }
	@GetMapping("facultycoursemapping")
	public ModelAndView facultycoursemapping()
	{
		ModelAndView mv = new ModelAndView("facultycoursemapping");
		
		List<Course> courselist = service.displayAllCourses();
		mv.addObject("coursedata", courselist);
		
		List<Faculty> facultylist = service.viewAllFaculty();
		mv.addObject("facultydata", facultylist);
		
		return mv;
	}
	
	
	
	
	@PostMapping("fcoursemappinginsert")
	  public ModelAndView fcoursemappinginsert(HttpServletRequest request)
	  {
		  String msg=null;
		  
		  ModelAndView mv = new ModelAndView();
		  
		  int fid = Integer.parseInt(request.getParameter("fid"));
		  int cid = Integer.parseInt(request.getParameter("cid"));
		  int section = Integer.parseInt(request.getParameter("section"));
		  
		  long n = service.checkFacultyCourseMapping(service.displayFacultyById(fid), service.displayCourseById(cid), section);
		  
		  if(n>0)
		  {
			  msg = "Mapping Already Done";
		  }
		  else
		  {
			  FacultyCourseMapping fcm = new FacultyCourseMapping();
			  
			  fcm.setCourse(service.displayCourseById(cid));
			  fcm.setFaculty(service.displayFacultyById(fid));
			  fcm.setSection(section);
			  
			  msg = service.facultyCourseMapping(fcm);
			  
		  }
		  
		  mv.addObject("msg", msg);
		  
		  mv.setViewName("redirect:/Admin/facultycoursemapping");
		  
		  return mv;
	  }
	
	@GetMapping("viewfcoursemapping")
	  public ModelAndView viewfcoursemapping()
	  {
		  ModelAndView mv = new ModelAndView("viewfcoursemapping");
		  
		  List<FacultyCourseMapping> fcmlist = service.displayFacultyCourseMapping();
		  mv.addObject("fcmdata", fcmlist);
	 	  
		  return mv;
	  }

	
}
