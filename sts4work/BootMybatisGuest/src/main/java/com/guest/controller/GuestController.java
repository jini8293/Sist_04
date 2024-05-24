package com.guest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.guest.dto.GuestDto;
import com.guest.service.GuestService;


@Controller
public class GuestController {
	
	@Autowired
	GuestService service;
	
	@GetMapping("/")
	public String home() {
		return "redirect:guest/list";
	}
	
	@GetMapping("/guest/list")
	public String list(Model model) {
		
		int totalCount = service.getTotalCount();
		model.addAttribute("totalCount", totalCount);
		
		List<GuestDto> list = service.getAllGuest();
		model.addAttribute("list", list);
		
		return "guest/guestlist";
	}
	
	

}
