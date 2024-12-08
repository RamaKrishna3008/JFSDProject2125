package com.klef.jfsd.sdp.controller;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyStudentCourseMaterials;
import com.klef.jfsd.sdp.model.Feedback;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.model.StudentCourseMapping;
import com.klef.jfsd.sdp.service.StudentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Student")
public class StudentController 
{
	
	@Autowired
	private StudentService studentService;
	
	private String generatedOtp;
    
    @Autowired
	private JavaMailSender javaMailSender;
	
	

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
		String email = request.getParameter("parentEmail");
		String status = "ACTIVE";
		String batch = request.getParameter("batch");
		String registarationStatus="Not Elgible";
		 Blob blob;
	        
	        if (file != null && !file.isEmpty()) {
	            byte[] bytes = file.getBytes();
	            blob = new SerialBlob(bytes);
	        } else {
	            Path defaultImagePath = Paths.get("src/main/webapp/images/default-profile-picture.jpg");
	            byte[] defaultImageBytes = Files.readAllBytes(defaultImagePath);
	            blob = new SerialBlob(defaultImageBytes);
	        }
		
		
		Student st = new Student(id, name, fatherName, motherName, contact,email, address, password, status,blob,batch,registarationStatus);
		
		if(studentService.updateStudent(st)) {
			 HttpSession session = request.getSession();
		        session.setAttribute("student", st);
		        session.setMaxInactiveInterval(300);
			mv.setViewName("studenthome");
			
		}else {
			mv.setViewName("studentdetailswithnavbar");
			String error = "Please Enter all the details correctly";
			mv.addObject("error", error);
		}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mv;
	}
	
	@PostMapping("/sendOtp")
    @ResponseBody
    public String sendOtp(@RequestParam String email) {
        generatedOtp = String.format("%06d", new Random().nextInt(999999)); 
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            
            String subject = "SHS University - OTP Verification";
            String htmlContent = """
            	    <div style="font-family: Arial, sans-serif; border: 1px solid #2c3e50; border-radius: 12px; padding: 20px; max-width: 550px; margin: auto; background-color: #ffffff;">
            	        <h2 style="color: #34495e; text-align: center; margin-bottom: 20px; font-size: 28px;">Welcome to <span style="color: #e67e22;">SHS University</span></h2>
            	        <p style="font-size: 16px; color: #2c3e50; line-height: 1.5;">
            	            Dear Parent,
            	        </p>
            	        <p style="font-size: 16px; color: #2c3e50; line-height: 1.5;">
            	            Thank you for registering your student at <b>SHS University</b>. To complete the email verification process, please use the following OTP:
            	        </p>
            	        <div style="text-align: center; margin: 30px 0;">
            	            <span style="font-size: 30px; color: #d35400; font-weight: bold; padding: 10px 20px; border: 2px dashed #d35400; border-radius: 5px;">%s</span>
            	        </div>
            	        <p style="font-size: 16px; color: #2c3e50; line-height: 1.5;">
            	            This OTP is valid for <b>10 minutes</b>. Please do not share it with anyone.
            	        </p>
            	        <hr style="margin: 20px 0; border: 0; border-top: 2px solid #2c3e50;">
            	        <p style="font-size: 14px; color: #7f8c8d; text-align: center; line-height: 1.5;">
            	            If you have any questions, contact us at <a href="mailto:support@shsuniversity.edu" style="color: #2980b9; text-decoration: none;">support@shsuniversity.edu</a>.
            	        </p>
            	        <p style="text-align: center; font-size: 14px; color: #7f8c8d;">
            	            © 2024 SHS University. All rights reserved.
            	        </p>
            	    </div>
            	    """.formatted(generatedOtp);

            
            System.out.println("Sending OTP to: " + email);

            
            helper.setFrom("beast375683@gmail.com");
            helper.setTo(email);
            helper.setSubject(subject);
            helper.setText(htmlContent, true); 
            System.out.println("Generated OTP: " + generatedOtp);
            javaMailSender.send(message);

            return "OTP sent successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error sending OTP!";
        }
    }
	
	 @PostMapping("/verifyOtp")
	    @ResponseBody
	    public String verifyOtp(@RequestParam String otp) {
	        if (generatedOtp != null && generatedOtp.equals(otp)) {
	            return "OTP Verified Successfully";
	        }
	        return "Invalid OTP!";
	    }
	
	@GetMapping("home")
	public ModelAndView StudentHome(HttpServletRequest request,HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		if(s==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
		List<StudentCourseMapping> scm = studentService.ViewAllCourses(s);
        double sum=0;
        for(int i=0;i<scm.size();i++)
        {
          sum = sum + (scm.get(i).getCourse().getCredits());
        }
		mv.addObject("courses",studentService.getRegisteredCoursesCount(s));
		mv.addObject("credits",sum );
		String sid = s.getId();
		float grade = updateCGPA(s);
		if(s.getMycgpa()!=grade) {
			String str = studentService.updateGrade(grade, s.getId());
		
		if(str!=null)
		{
			session.removeAttribute("student");
			session.setAttribute("student", studentService.viewStudentById(sid));
			session.setMaxInactiveInterval(300);
		}
		}
		mv.setViewName("studenthome");
		return mv;
	}
	
	@GetMapping("details")
	public ModelAndView StudentDetails() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentdetailswithnavbar");
		return mv;
	}
	@GetMapping("FirstLogin")
	public ModelAndView FirstLogin() {
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
	public ModelAndView StudentCourseRegistartion(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("StudentCourseRegistartion");
		HttpSession session = request.getSession();
		Student student = (Student) session.getAttribute("student");
		if(student==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
		
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
			mv.addObject("message","Not Eligible To Register Please Contact Admin");
		}
		
		return mv;
	}
	
	@PostMapping("Courses/Register")
	public ModelAndView CoursesRegister(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		
		int n = Integer.parseInt(request.getParameter("n"));
		
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		try {
			if(s==null)
			{
				response.sendRedirect("/SessionExpiry");
				return null ;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		Map<Integer, StudentCourseMapping> mappings = new HashMap<>();

		for (int i = 1; i <= n; i++) {
		    String sections = request.getParameter(Integer.toString(i));
		    if (sections != null && !sections.isEmpty()) {
		        String[] parts = sections.split("/");
		        int courseId = Integer.parseInt(parts[0]);
		        int section = Integer.parseInt(parts[1]);
		        int facultyId = Integer.parseInt(parts[2]);

		        long number = studentService.checkStudentCourseMapping(s.getId(), courseId);

		        if (number == 0) {
		            Course course = studentService.displayCourseById(courseId);
		            Faculty faculty = studentService.displayFacultyById(facultyId);

		            StudentCourseMapping mapping = new StudentCourseMapping();
		            mapping.setSection(section);
		            mapping.setCourse(course);
		            mapping.setFaculty(faculty);
		            mapping.setStudent(s);
		            
		            studentService.removeCapacity(courseId, facultyId, section);
		            
		            mappings.put(i, mapping);
		        }
		    }
		}

		studentService.MapCoursesToStudent(mappings);
		mv.addObject("message","Registered Successfully");
		mv.setViewName("redirect:/Student/ViewMyCoursesHome");
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
	public ModelAndView ViewMyCourses(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		if(s==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
		String ay=request.getParameter("academicyear");
		String sem =request.getParameter("sem");
		mv.setViewName("ViewMyCoursesStudent");
		mv.addObject("sem", sem);
		mv.addObject("ay",ay);
		List<StudentCourseMapping> scm = studentService.viewStudentCourses(ay, sem,s);
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
	
	@GetMapping("displaymaterialbyid/{id}")
	public ResponseEntity<byte[]> displaymaterialByid(@PathVariable int id) throws Exception {
	    FacultyStudentCourseMaterials studentCourseMaterials = studentService.ViewMaterialById(id);
	    byte[] materialBytes = studentCourseMaterials.getMaterial().getBytes(1, (int) studentCourseMaterials.getMaterial().length());
	    
	    String filename = studentCourseMaterials.getFilename();

	    return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename="+filename+".pdf")
                .body(materialBytes);
	}
	
	
	@GetMapping("AttendanceRegisterHome")
	public ModelAndView AttendanceRegisterHome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Student_AttendanceRegisterHome");
		return mv;
	}
	
	@GetMapping("AttendanceRegister")
	public ModelAndView AttendanceRegister(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		String ay=request.getParameter("academicyear");
		String sem =request.getParameter("sem");
		mv.setViewName("Student_AttendanceRegister");
		mv.addObject("sem", sem);
		mv.addObject("ay",ay);
		List<Course> clist = studentService.viewCourseBySem(ay, sem);
		
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		
		if(s==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
				
		List<Map<String, Object>> attendanceDetails = new ArrayList<Map<String, Object>>();

	    for (Course course : clist) 
	    {
	    	
	    	int sec = studentService.findSectionByCourseAndStudent(course, s);
	    	if(sec!=-1) {
	        Map<String, Object> details = new HashMap<>();
	        	details.put("courseName", course.getCoursetitle());
	        	details.put("courseCode", course.getCoursecode());
	        	details.put("section",sec );
	        	details.put("attendancePercentage", studentService.getStudentAttedance(course, s,sec));

	        	attendanceDetails.add(details);
	    	}
	    }

	    mv.addObject("attendanceDetails", attendanceDetails);
	    return mv;

	}
	
	@GetMapping("MyCGPA")
	public ModelAndView MyCGPA(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		if(s==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
				
		List<StudentCourseMapping> scm = studentService.MyCGPA(s.getId());
		String sid = s.getId();
		
		float grade = updateCGPA(s);
		if(s.getMycgpa()!=grade) {
			String str = studentService.updateGrade(grade, s.getId());
		
		if(str!=null)
		{
			session.removeAttribute("student");
			session.setAttribute("student", studentService.viewStudentById(sid));
		}
		}
		
		
		mv.setViewName("MyCGPA");
		mv.addObject("slist",scm);
		return mv;

	}
	
	@GetMapping("EndSemResultHome")
	public ModelAndView EndSemResultHome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("EndSemResultHome");
		return mv;
	}
	
	@GetMapping("EndSemResult")
	public ModelAndView EndSemResult(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		if(s==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
		
		String ay=request.getParameter("academicyear");
		String sem =request.getParameter("sem");
				
		List<StudentCourseMapping> scm = studentService.viewStudentCourses(ay, sem,s);
		
		float grade;
		int totalgrade = 0;
		float totalcredits = 0;
		
		for(StudentCourseMapping mapping : scm)
		{
			if(mapping.getStudentInternals() != -1 && mapping.getStudentExternals() != -1)
			{
				totalgrade += (mapping.getGrade()*mapping.getCourse().getCredits());
				totalcredits += mapping.getCourse().getCredits();
			}
		}
		
		 if (totalcredits != 0) {
		        grade = (float) totalgrade / totalcredits;
		        grade = (float) Math.ceil(grade * 100) / 100;
		    } else {
		        grade = 0; 
		    }
		
		mv.addObject("grade",grade);
		mv.setViewName("EndSemResult");
		mv.addObject("slist",scm);
		return mv;

	}
	
	@GetMapping("GiveCourseFeedBack")
	public ModelAndView GiveCourseFeedBack(@RequestParam int cid,@RequestParam int fid,HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		if(s==null)
		{
			response.sendRedirect("/SessionExpiry");
			return null ;
		}
		
		long n = studentService.countCourseIdAndStudentId(cid, s.getId());
		
		if(n!=0)
		{
			mv.addObject("message","Feed Back Already Given");
		}
		else {
		mv.addObject("courseId", cid);
		mv.addObject("fid", fid);
		mv.addObject("coursename",studentService.displayCourseById(cid).getCoursetitle());
		mv.addObject("facultyname", studentService.displayFacultyById(fid).getName());
		}
		mv.setViewName("GiveCourseFeedBackStudent");
		return mv;
	}
	
	@PostMapping("/submitFeedback")
    public String submitFeedback(HttpServletRequest request, Model model) {
        try {
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            int facultyId = Integer.parseInt(request.getParameter("facultyId"));
            String studentId = request.getParameter("studentId");
            String question1Feedback = request.getParameter("question1");
            String question2Feedback = request.getParameter("question2");
            String question3Feedback = request.getParameter("question3");
            String question4Feedback = request.getParameter("question4");
            String question5Feedback = request.getParameter("question5");

            Feedback feedback = new Feedback();
            feedback.setCourseId(courseId);
            feedback.setFacultyId(facultyId);
            feedback.setStudentId(studentId);
            feedback.setQuestion1Feedback(question1Feedback);
            feedback.setQuestion2Feedback(question2Feedback);
            feedback.setQuestion3Feedback(question3Feedback);
            feedback.setQuestion4Feedback(question4Feedback);
            feedback.setQuestion5Feedback(question5Feedback);

            studentService.saveFeedback(feedback);

            model.addAttribute("message", "Feedback submitted successfully!");
        } catch (Exception e) {
            model.addAttribute("error", "Error submitting feedback. Please try again.");
            e.printStackTrace();
        }

        return "ViewMyCoursesHome";
    }	
	
	public float updateCGPA(Student s)
	{
		List<StudentCourseMapping> scm = studentService.MyCGPA(s.getId());
		
		float grade;
		int totalgrade = 0;
		float totalcredits = 0;
		
		for(StudentCourseMapping mapping : scm)
		{
			if(mapping.getStudentInternals() != -1 && mapping.getStudentExternals() != -1)
			{
				totalgrade += (mapping.getGrade()*mapping.getCourse().getCredits());
				totalcredits += mapping.getCourse().getCredits();
			}
		}
		
		 if (totalcredits != 0) {
		        grade = (float) totalgrade / totalcredits;
		        grade = (float) Math.ceil(grade * 100) / 100;
		    } else {
		        grade = 0;
		    }
		 return grade;
		
	}
	
}
