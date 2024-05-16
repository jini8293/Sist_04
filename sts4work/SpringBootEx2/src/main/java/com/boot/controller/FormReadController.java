package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.boot.data.InfoDto;


@Controller
public class FormReadController {
	
	@PostMapping("/sist/read1")
	public ModelAndView read1(@RequestParam String name, @RequestParam int java, @RequestParam int spring) {
		
		ModelAndView model = new ModelAndView();
		
		model.addObject("name",name);
		model.addObject("java",java);
		model.addObject("spring",spring);
		
		model.addObject("total", java+spring);
		model.addObject("avg", (java+spring)/2.0);
		
		model.setViewName("result/result1");		
		
		return model;		
	}
	
	@PostMapping("/sist/read2")
	public String show2(@ModelAttribute("dto") InfoDto dto) {
		
		return "result/result2";
		
	}
	
	@PostMapping("/sist/write3")
	public ModelAndView read3(@RequestParam String name, @RequestParam String blood, @RequestParam String buseo){
		ModelAndView model = new ModelAndView();
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("name", name);
		map.put("blood", blood);
		map.put("buseo", buseo);
		
		model.addAllObjects(map);
		
		model.setViewName("result/result3");
		
		return model;
	}

}
