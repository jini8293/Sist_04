package com.sist.anno1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic") 
public class LogicController {
	
	@Autowired
	DaoInter inter;
	public LogicController() {
		// TODO Auto-generated constructor stub
	}
	
	public LogicController(MyDao dao) {
		this.inter=dao;
	}

	//insert
	public void insert(String str) {
		inter.insertData(str);
	}

	public void delete(String num) {
		inter.deleteData(num);
	}
}

