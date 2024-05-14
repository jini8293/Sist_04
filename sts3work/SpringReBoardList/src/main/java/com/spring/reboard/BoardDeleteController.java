package com.spring.reboard;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.data.BoardDaoIn;

@Controller
public class BoardDeleteController {
	
	@Autowired
	BoardDaoIn dao;
	
	@GetMapping("/board/deletepassform")
	public ModelAndView deleteform(@RequestParam int num, @RequestParam String currentPage) {
		ModelAndView model = new ModelAndView();
		
		model.addObject("num",num);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("board/deletepassForm");
		
		return model;		
	}
	
	@PostMapping("/board/delete")
	public ModelAndView delete(@RequestParam int num,HttpSession session, @RequestParam String currentPage, @RequestParam int pass) {
		ModelAndView model = new ModelAndView();
		String photo = dao.getOneData(num).getPhoto();
		
		int check = dao.getCheckPass(num, pass);
		
		if(check==1) {
			if(!photo.equals("no")) {
				String []fname=photo.split(",");
				//실제 업로드 경로
				String path = session.getServletContext().getRealPath("/WEB-INF/photo");
				for(String f:fname) {
					File file = new File(path+"\\"+f);
					file.delete();
				}
			}
			
			dao.deleteBoard(num);
			model.setViewName("redirect:list?currentPage="+currentPage);
		}else {
			model.setViewName("board/passFail");
		}
		
		
		return model;
	}


}
