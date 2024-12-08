package com.klef.jfsd.sdp.controller;

import java.util.Base64;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.AdminService;
import com.klef.jfsd.sdp.service.CaptchaService;
import com.klef.jfsd.sdp.service.FacultyService;
import com.klef.jfsd.sdp.service.StudentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BaseController 
{
	@Autowired
	AdminService adminService;
	
	@Autowired
	FacultyService facultyService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CaptchaService captchaService;
	
	private String generatedOtp;
    
    
    @Autowired
	private JavaMailSender javaMailSender;
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	
	
	@GetMapping("Logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		ModelAndView mv= new ModelAndView("login");
		HttpSession session = request.getSession();
		session.invalidate();
		return mv;
	}
	
	@GetMapping("login")
	public ModelAndView studentlogin() 
	{
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	@PostMapping("/reset-password")
	public ModelAndView postresetpassword(HttpServletRequest request)
	{
		ModelAndView mv = new  ModelAndView();
		
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("password");
		System.out.println(uname);
		
		Student s = studentService.viewStudentById(uname);
		Faculty f = facultyService.viewFacultyByUsername(uname);
		
		if(f!=null)
		{
			f.setPassword(pwd);
			facultyService.UpdateFacultyProfile(f);
		}
		if(s!=null)
		{
			s.setPassword(pwd);
			adminService.updateStudent(s);
		}
		
		mv.addObject("message","Password Reset Success");
		mv.setViewName("redirect:/login");
		return mv;
		
	}
	
	@GetMapping("resetpassword")
	public ModelAndView resetpassword() 
	{
		ModelAndView mv = new ModelAndView("resetpassword");
		return mv;
	}
	
	@PostMapping("checklogin")
	public ModelAndView checkAdminlogin(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
 		
		String Captcha = request.getParameter("Captcha");
		
		boolean isCaptchaValid = captchaService.validateCaptcha(Captcha);

	    if (!isCaptchaValid) 
	    {
	        mv.addObject("message", "Invalid Captcha. Please try again.");
	        mv.setViewName("redirect:/login");
	        return mv;
	    }
	    else {
		Admin a = adminService.checkAdminLogin(username, pwd);
		Faculty f = facultyService.CheckFacultyLogin(username, pwd);
		Student st = studentService.studentLogin(username, pwd);
		
		
		if(a!=null)
		{
			HttpSession session=request.getSession();
			session.setAttribute("Admin", a);
			session.setMaxInactiveInterval(300);
			mv.addObject("message","success");
			mv.setViewName("redirect:/Admin/Home");
				
		}
		
		else if(f!=null)
		{
			if(f.getActive().equals("NA"))
			{
				mv.addObject("message", "Account Deleted Contact Admin");
				mv.setViewName("redirect:/login");
			}
			else
			{
			HttpSession session=request.getSession();
			session.setAttribute("faculty", f);
			session.setMaxInactiveInterval(300);
			mv.setViewName("redirect:/Faculty/Home");
			mv.addObject("message","success");
			}
			
			
				
		}
		else if (st != null) {
		        HttpSession session = request.getSession();
		        session.setAttribute("student", st);
		        session.setMaxInactiveInterval(300);
		        if (st.getStatus().equals("NC")) {
		           
		            mv.setViewName("redirect:/Student/FirstLogin");
		        } 
		        else if(st.getStatus().equals("NA"))
		        {
		        	mv.addObject("message", "Account Deleted Contact Admin");
					mv.setViewName("redirect:/login");
		        }
		        else {
		        	mv.addObject("message","success");
		            mv.setViewName("redirect:/Student/home");
		        }
		    }
		else
		{
			mv.addObject("message", "Login Failed");
			mv.setViewName("redirect:/login");
		}
		
		return mv;
	    }
	}

	@PostMapping("/sendOtp")
	@ResponseBody
	public ResponseEntity<String> sendOtp(@RequestParam String username,HttpServletRequest request) 
	{
	    if (username == null || username.trim().isEmpty()) {
	        return ResponseEntity.badRequest().body("Invalid username");
	    }

	    Student student = studentService.viewStudentById(username);
	    Faculty faculty = facultyService.viewFacultyByUsername(username);

	    if (student == null && faculty == null) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
	    }

	    try {
	        generatedOtp = String.format("%06d", new Random().nextInt(999999));
	        String email = null;
	        
	        if(student!=null)
	        {
	        	email=student.getParentEmail();
	        	HttpSession session=request.getSession();
				session.setAttribute("studentreset", student);
				session.setMaxInactiveInterval(90);
	        	
	        }
	        if(faculty!=null)
	        {
	        	email=faculty.getEmail();
	        	HttpSession session=request.getSession();
				session.setAttribute("facultyreset", faculty);
				session.setMaxInactiveInterval(90);
	        	
	        }
	        

	        MimeMessage message = javaMailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);

	        String subject = "SHS University - OTP Verification";
	        String htmlContent = """
	        	    <div style="font-family: Arial, sans-serif; border: 1px solid #2c3e50; border-radius: 12px; padding: 20px; max-width: 550px; margin: auto; background-color: #ffffff;">
	        	        <h2 style="color: #34495e; text-align: center; margin-bottom: 20px; font-size: 28px;">Password Reset Request</h2>
	        	        <p style="font-size: 16px; color: #2c3e50; line-height: 1.6;">
	        	            Dear User,
	        	        </p>
	        	        <p style="font-size: 16px; color: #2c3e50; line-height: 1.6;">
	        	            We received a request to reset your password for your <b>SHS University</b> account. To proceed with resetting your password, please use the following OTP:
	        	        </p>
	        	        <div style="text-align: center; margin: 30px 0;">
	        	            <span style="font-size: 30px; color: #d35400; font-weight: bold; padding: 10px 20px; border: 2px dashed #d35400; border-radius: 5px;">%s</span>
	        	        </div>
	        	        <p style="font-size: 16px; color: #2c3e50; line-height: 1.6;">
	        	            This OTP is valid for <b>10 minutes</b>. If you did not request a password reset, please ignore this email or contact support.
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


	        helper.setFrom("beast375683@gmail.com");
	        helper.setTo(email);
	        helper.setSubject(subject);
	        helper.setText(htmlContent, true);

	        javaMailSender.send(message);

	        return ResponseEntity.ok("OTP sent successfully!");
	    } catch (Exception e) {
	        
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body("Error sending OTP. Please try again later.");
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

	
	
    
    @GetMapping("/getcaptcha/{length}")
    @ResponseBody
    public String getCaptcha(@PathVariable("length") int captchaLength)
    {
    	
    	return Base64.getEncoder().encodeToString(captchaService.generateCaptcha(captchaLength));
    }


@PostMapping("/validate")
public String validateCaptcha(HttpServletRequest request) {
	String captchaInput = request.getParameter("Captcha");
    boolean isValid = captchaService.validateCaptcha(captchaInput);
    if(isValid)
    	return "Verified";
    else
    	return "Wrong Captcha";
}

@GetMapping("SessionExpiry")
public ModelAndView sessionexpiry()
{
	ModelAndView mv = new ModelAndView();
	mv.addObject("message", "Session Expired");
	mv.setViewName("redirect:/login");
	return mv;
	
}

@GetMapping("/error-404")
public ModelAndView handle404Error()
{
   ModelAndView mv = new ModelAndView();
   mv.setViewName("error-404");
   return mv;
}
	
}
