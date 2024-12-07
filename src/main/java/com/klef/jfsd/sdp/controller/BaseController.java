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
			System.out.println(f.getId());
			f.setPassword(pwd);
			facultyService.UpdateFacultyProfile(f);
		}
		if(s!=null)
		{
			System.out.println(s.getId());
			s.setPassword(pwd);
			adminService.updateStudent(s);
		}
		
		mv.addObject("message","Password Reset Success");
		mv.setViewName("redirect:/login");
		return mv;
		
	}
	
	@GetMapping("resetpassword")
	public ModelAndView resetpassword(@RequestParam String username) 
	{
		ModelAndView mv = new ModelAndView("resetpassword");
		mv.addObject("uname",username);
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
			mv.setViewName("redirect:/Faculty/Home");
			mv.addObject("message","success");
			}
			
			
				
		}
		else if (st != null) {
		        HttpSession session = request.getSession();
		        session.setAttribute("student", st);
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
	public ResponseEntity<String> sendOtp(@RequestParam String username) 
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

	        String email = student != null ? student.getParentEmail() : faculty.getEmail();

	        MimeMessage message = javaMailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);

	        String subject = "SHS University - OTP Verification";
	        String htmlContent = """
	        <div style="font-family: Arial, sans-serif; border: 1px solid #ccc; border-radius: 8px; padding: 20px; max-width: 500px; margin: auto; background-color: #f9f9f9;">
	        <h2 style="color: #2c3e50; text-align: center;">Password Reset Request</h2>
	        <p style="font-size: 16px; color: #34495e;">Dear User,</p>
	        <p style="font-size: 16px; color: #34495e;">
	        We received a request to reset your password for your <b>SHS University</b> account. To proceed with resetting your password, please use the following OTP:
	        </p>
	        <div style="text-align: center; margin: 20px 0;">
	        <span style="font-size: 24px; color: #e74c3c; font-weight: bold;">%s</span>
	        </div>
	        <p style="font-size: 16px; color: #34495e;">This OTP is valid for 10 minutes. If you did not request a password reset, please ignore this email or contact support.</p>
	        <hr style="margin: 20px 0; border: 0; border-top: 1px solid #ccc;">
	        <p style="font-size: 14px; color: #7f8c8d; text-align: center;">
	        If you have any questions, contact us at <a href="mailto:support@shsuniversity.edu" style="color: #2980b9;">support@shsuniversity.edu</a>.
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
	
}
