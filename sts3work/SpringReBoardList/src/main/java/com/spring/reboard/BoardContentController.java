package com.spring.reboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.answerdata.AnswerDao;
import com.spring.answerdata.AnswerDto;
import com.spring.data.BoardDaoIn;
import com.spring.data.BoardDto;

@Controller
public class BoardContentController {

	@Autowired
	BoardDaoIn dao;
	@Autowired
	AnswerDao adao;

	@GetMapping("/board/content")
	public ModelAndView content(@RequestParam int num,
			@RequestParam int currentPage)
	{
		ModelAndView mview=new ModelAndView();
		
		dao.updateReadCount(num);
		
		BoardDto dto=dao.getOneData(num);
		
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		
		//num에 해당하는 댓글 ad에서 가져와서 보낸다
		List<AnswerDto> alist = adao.getAnswerList(num);
		
		//댓글이 있을때만 보내야함
		mview.addObject("alist", alist);
		mview.addObject("acount", alist.size());
		
		mview.setViewName("board/content");
		return mview;
	}

}
