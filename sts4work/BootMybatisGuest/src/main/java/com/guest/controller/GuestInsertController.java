package com.guest.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.guest.dto.GuestDto;
import com.guest.service.GuestService;

import jakarta.servlet.http.HttpSession;

@Controller
public class GuestInsertController {

	@Autowired
	GuestService service;

	String photo;

	@PostMapping("/guest/upload")
	@ResponseBody
	public Map<String, String> upload(@ModelAttribute("dto") GuestDto dto, HttpSession session,
			@RequestParam ArrayList<MultipartFile> photos) {

		String realPath = session.getServletContext().getRealPath("/guestphoto");
		photo = "";

		if (photos.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : photos) {
				String fName = f.getOriginalFilename();
				photo += fName + ",";
				
				try {
					f.transferTo(new File(realPath+"\\"+fName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			photo.substring(0, photo.length()-1);
		}
		Map<String, String> map = new HashMap<>();
		this.photo = photo;
		map.put("photoname", photo);

		return map;
	}

	@PostMapping("/guest/insert")
	@ResponseBody
	public Map<String, String> insert(@ModelAttribute("dto") GuestDto dto) {

		dto.setPhoto(photo);
		service.insertGuest(dto);

		Map<String, String> map = new HashMap<>();

		map.put("msg", "insert성공");

		return map;
	}
	
	@GetMapping("/guest/delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam int num, @RequestParam String pass){
		
		Map<String , Object> map = new HashMap<>();
		
		int b = service.CheckPass(num, pass);
		
		if(b==1) {
			service.deleteGuest(num);
		}
		map.put("st", b);
		return map;		
	}

}
