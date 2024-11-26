package com.klef.jfsd.sdp.controller;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.AdminService;
import com.klef.jfsd.sdp.service.CaptchaService;
import com.klef.jfsd.sdp.service.FacultyService;
import com.klef.jfsd.sdp.service.StudentService;

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
	public ModelAndView studentlogin() {
		ModelAndView mv = new ModelAndView("login");
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
		           
		            mv.setViewName("redirect:/Student/details");
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
	
}
