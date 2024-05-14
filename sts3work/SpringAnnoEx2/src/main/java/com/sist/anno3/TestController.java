package com.sist.anno3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TestController {
	
	@Autowired
	TestDao testDao;
	
	public void insert(String name) {
		testDao.insert(name);
	}
	
	public void delete(String num) {
		testDao.delete(num);
	}
	
	public void select(String name) {
		testDao.select(name);
	}

}