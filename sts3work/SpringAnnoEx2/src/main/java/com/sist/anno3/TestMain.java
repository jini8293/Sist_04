package com.sist.anno3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMain {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("annoContext1.xml");
		
		TestController con = (TestController)context.getBean("testController");
		
		con.insert("이효리");
		con.delete("3");
		con.select("이상순");

	}

}
