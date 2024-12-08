package com.klef.jfsd.sdp.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Attendance;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.StudentCourseMapping;
import com.klef.jfsd.sdp.service.AdminService;
import com.klef.jfsd.sdp.service.FacultyService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Faculty")
public class FacultyController 
{
	@Autowired
	FacultyService facultyService;
	
	@Autowired
	AdminService service;
	
	@Autowired
	private JavaMailSender mailSender;	
	
	
	
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
		session.setMaxInactiveInterval(250);
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
	public ModelAndView viewFacultyMappedCourses(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewFacultyMappedCourses");
		
		String ay=request.getParameter("academicyear");
		String sem =request.getParameter("sem");
		HttpSession session = request.getSession(); 
		Faculty f = (Faculty)session.getAttribute("faculty");
		if(f==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
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
	
	@GetMapping("Attendance/View")
	public ModelAndView GetStudentsByCourses(@RequestParam int fid,@RequestParam int cid,@RequestParam int section)
	{
		ModelAndView mv = new ModelAndView();
		List<StudentCourseMapping> scm = facultyService.findStudentsByFacultyId(fid, cid, section);
		
		if(scm!=null && !scm.isEmpty()) 
		{
			scm.sort(Comparator.comparing(mapping -> mapping.getStudent().getId()));
			mv.addObject("slist",scm);
			mv.addObject("Course",scm.get(0).getCourse());
			mv.addObject("section", scm.get(0).getSection());
		}
		else
		{
			mv.addObject("msg","No Students Available At this Moment");
		}
		mv.setViewName("Faculty_AttendanceRegister");
		return mv;
	}
	




	private void sendAbsenceNotificationEmail(Student student, Course course, int section, String date, int hour) {
	    try {
	        String parentEmail = student.getParentEmail();
	        
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	        
	        helper.setFrom("your-university-email@example.com");
	        helper.setTo(parentEmail);
	        helper.setSubject("Absence Notification - " + student.getName() + " (ID: " + student.getId() + ")");
	        
	        String emailContent = createAbsenceEmailContent(student, course, section, date, hour);
	        
	        helper.setText(emailContent, true);
	        
	        mailSender.send(message);
	        
	        System.out.println("Absence notification email sent to parent of " + student.getName());
	    } catch (Exception e) {
	        System.err.println("Error sending absence notification email: " + e.getMessage());
	        e.printStackTrace();
	    }
	}

	private String createAbsenceEmailContent(Student student, Course course, int section, String date, int hour) {
	    return "<!DOCTYPE html>" +
	    "<html lang='en'>" +
	    "<head>" +
	    " <meta charset='UTF-8'>" +
	    " <style>" +
	    " body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }" +
	    " .container { max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f4f4f4; }" +
	    " .header { background-color: #1a237e; color: white; padding: 20px; text-align: center; }" +
	    " .content { background-color: white; padding: 20px; }" +
	    " .footer { text-align: center; color: #777; margin-top: 20px; }" +
	    " </style>" +
	    "</head>" +
	    "<body>" +
	    " <div class='container'>" +
	    " <div class='header'>" +
	    " <h1>SHS University</h1>"+
	    " <h3>Student Absence Notification</h3>" +
	    " </div>" +
	    " <div class='content'>" +
	    " <h2>Dear Parent,</h2>" +
	    " <p>This is to inform you that your child has been marked absent:</p>" +
	    " <table>" +
	    " <tr><td><strong>Student Name:</strong></td><td>" + student.getName() + "</td></tr>" +
	    " <tr><td><strong>Student ID:</strong></td><td>" + student.getId() + "</td></tr>" +
	    " <tr><td><strong>Course:</strong></td><td>" + course.getCoursetitle() + "</td></tr>" +
	    " <tr><td><strong>Section:</strong></td><td>" + section + "</td></tr>" +
	    " <tr><td><strong>Date:</strong></td><td>" + date + "</td></tr>" +
	    " <tr><td><strong>Hour:</strong></td><td>" + hour + "</td></tr>" +
	    " </table>" +
	    " <p>Please ensure your child maintains regular attendance.</p>" +
	    " </div>" +
	    " <div class='footer'>" +
	    " <p>© " + Year.now().getValue() + " SHS University. All rights reserved.</p>" +
	    " </div>" +
	    " </div>" +
	    "</body>" +
	    "</html>"; 
	}

	@PostMapping("Attendance/Post")
	public ModelAndView PostAttendance(HttpServletRequest request,HttpServletResponse response) throws IOException {
	    ModelAndView mv = new ModelAndView();

	    HttpSession session = request.getSession();
	    Faculty f = (Faculty) session.getAttribute("faculty");
	    if(f==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
	    int cid = Integer.parseInt(request.getParameter("courseId"));
	    int section = Integer.parseInt(request.getParameter("section"));
	    Course c = service.displayCourseById(cid);

	    List<StudentCourseMapping> scm = facultyService.findStudentsByFacultyId(f.getId(), c.getCourseid(), section);
	    scm.sort(Comparator.comparing(mapping -> mapping.getStudent().getId()));

	    Map<Integer, Attendance> map = new HashMap<Integer, Attendance>();

	    for (int i = 0; i < scm.size(); i++) {
	        String[] selectedHours = request.getParameterValues("hours");

	        for (String hour : selectedHours) {
	            Attendance att = new Attendance();
	            att.setStudent(scm.get(i).getStudent());
	            att.setCourse(c);
	            att.setSection(section);

	            att.setHour(Integer.parseInt(hour));

	            String present = request.getParameter(Integer.toString(i));
	            att.setPresent(!("true".equals(present)));

	            LocalDate today = LocalDate.now();
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	            String formattedDate = today.format(formatter);
	            att.setDate(formattedDate);

	            if (!att.isPresent()) {
	                sendAbsenceNotificationEmail(
	                    scm.get(i).getStudent(), 
	                    c, 
	                    section, 
	                    formattedDate, 
	                    Integer.parseInt(hour)
	                );
	            }

	            System.out.println(selectedHours + present + formattedDate);
	            map.put(i, att);
	        }
	    }
	    
	    String msg = facultyService.PostAttendance(map);
	    mv.addObject("message", msg);
	    mv.setViewName("redirect:/Faculty/viewFacultyMappedCoursesHome");
	    return mv;
	}
	
	@GetMapping("AddStudentInternals")
	public ModelAndView AddStudentInternals(@RequestParam int fid,@RequestParam int cid,@RequestParam int section)
	{
		ModelAndView mv = new ModelAndView();
		List<StudentCourseMapping> scm = facultyService.findStudentsByFacultyId(fid, cid, section);
		if(scm!=null && !scm.isEmpty()) 
		{
			scm.sort(Comparator.comparing(mapping -> mapping.getStudent().getId()));
			mv.addObject("slist",scm);
			mv.addObject("Course",scm.get(0).getCourse());
			mv.addObject("section", scm.get(0).getSection());
		}
		else
		{
			mv.addObject("msg","No Students Available At this Moment");
		}
		mv.setViewName("FacultyAddingStudentInternals");
		return mv;
	}
	
	@PostMapping("AddStudentInternals/Post")
	public ModelAndView AddStudentInternalsPosting(HttpServletRequest request,HttpServletResponse response) throws IOException {
	    ModelAndView mv = new ModelAndView();

	    HttpSession session = request.getSession();
	    Faculty f = (Faculty) session.getAttribute("faculty");
	    if(f==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
	    int cid = Integer.parseInt(request.getParameter("courseId"));
	    int section = Integer.parseInt(request.getParameter("section"));


	    List<StudentCourseMapping> scmList = facultyService.findStudentsByFacultyId(f.getId(), cid, section);

	    scmList.sort(Comparator.comparing(mapping -> mapping.getStudent().getId()));

	    for (int i = 0; i < scmList.size(); i++) {
	        StudentCourseMapping scm = scmList.get(i);

	        String internals = request.getParameter(Integer.toString(i));
	        int studentInternals = -1;
	        if(scm.getStudentInternals() == -1 && !internals.isEmpty()) 
	        {
	        	studentInternals = Integer.parseInt(internals);
	        	scm.setStudentInternals(studentInternals);

	        facultyService.UpdateInternals(scm);
	        }
	    }

	    mv.addObject("message", "Internals updated successfully!");
	    mv.setViewName("redirect:/Faculty/viewFacultyMappedCoursesHome");

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
		
		String msg = facultyService.AddMaterials(materials);
		mv.addObject("cid",cid);
		mv.addObject("section",section);
		mv.addObject("message",msg);
		mv.setViewName("redirect:/Faculty/AddCourseMaterials");
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
