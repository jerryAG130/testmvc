package com.lavender.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.*;
import com.lavender.service.*;
import com.lavender.model.*;
import org.springframework.cache.support.SimpleCacheManager;
import org.springframework.beans.factory.annotation.Autowired;

@Controller  
public class HelloController {  
  
	@Autowired
	private UserService userService;

	@RequestMapping ( "/test" )  
	public String hello(Model model) {  
		User user = userService.findById(1L);
		System.out.println("===========================");
		model.addAttribute("user",user);
		return "test";
	}

	@RequestMapping ( value = "/j_spring_security_check",method = RequestMethod.POST) 
	public String login(@RequestParam("j_username") String username,
						@RequestParam("j_password") String password) {  
		System.out.println("===========================username"+username);
		System.out.println("===========================password"+password);
		
		return "hello";
	}
  
}   
