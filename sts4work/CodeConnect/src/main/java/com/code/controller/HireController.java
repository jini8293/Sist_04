package com.code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HireController {
	
	@GetMapping("/")
	public String home() {
		return "hire/hiremain";
	}
	
	@GetMapping("/hire/hirewrite")
	public String home2() {
		return "hire/hirewrite";
	}
	
	@ResponseBody
	@PostMapping("hire/insert")
	public String hireInsert() {
		return null;
	}
	

}
