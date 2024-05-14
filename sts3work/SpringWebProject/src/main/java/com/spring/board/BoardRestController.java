package com.spring.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BoardRestController {
	
	@Autowired
	BoardDaoIn dao;
	
	@GetMapping("/ajax/list1")
	public List<BoardDto> list1(){
		return dao.getPhotoLists(); //json형태로 반환
	}
	
	@GetMapping("/ajax/list2")
	public List<BoardDto> list2(){
		return dao.getAllBoard();
	}

}
