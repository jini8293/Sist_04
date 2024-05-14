package com.spring.answercontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.answerdata.AnswerDao;
import com.spring.answerdata.AnswerDto;

@Controller
public class AnswerController {
	
	@Autowired
	AnswerDao adao;
	
	@PostMapping("/board/ainsert")
	public String answerinsert(@ModelAttribute("dto") AnswerDto dto, @RequestParam String currentPage) {
		
		adao.insertAnswer(dto);
		
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
		
	}

}
