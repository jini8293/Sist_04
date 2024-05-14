package com.spring.reboard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.data.BoardDaoIn;
import com.spring.data.BoardDto;

@Controller
public class BoardUpdateController {
	
	@Autowired
	BoardDaoIn dao;
	
	@GetMapping("/board/updatepassform")
	public ModelAndView updateform(@RequestParam int num, @RequestParam String currentPage) {
		ModelAndView model = new ModelAndView();
		
		model.addObject("num",num);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("board/updatepassForm");
		
		return model;		
	}
	
	@PostMapping("/board/updatepass")
	public ModelAndView updatepass(@RequestParam int num, @RequestParam String currentPage, @RequestParam int pass) {
		ModelAndView model = new ModelAndView();
		
		int check = dao.getCheckPass(num, pass);
		
		if(check==1) {
			BoardDto dto = dao.getOneData(num);
			model.addObject("dto",dto);
			model.addObject("currentPage",currentPage);
			
			model.setViewName("board/updateForm");	
			
		}else {
			model.setViewName("board/passFail");	
		}
		return model;
	}
	
	@PostMapping("/board/update")
	public String update(@ModelAttribute("dto") BoardDto dto, @RequestParam ArrayList<MultipartFile> upload,
			HttpSession session, @RequestParam String currentPage, @RequestParam int num) {

		// �̹����� ���ε�� ����
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);

		// �̹��� ���ε� ���Ұ�� no��� ����
		String photo = "";

		// ������å�� �ϸ� ,�� ����
		if (upload.get(0).getOriginalFilename().equals("")) {
			photo = "no";
		} else {
			for (MultipartFile f : upload) {
				String fname = f.getOriginalFilename();
				photo += fname + ",";

				// ���ε�
				try {
					f.transferTo(new File(path + "\\" + fname));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			// photo���� ������ ,����
			photo = photo.substring(0, photo.length() - 1);
		}
		//dto�� photo�� �־��ֱ�
		dto.setPhoto(photo);
		
		dao.updateBoard(dto);
		
		return "redirect:content?num="+num+"&currentPage="+currentPage;
	}

}
