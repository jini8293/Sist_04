package com.sist.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class StudentMain {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext4.xml");
		
		Sungjuk data = context.getBean("sj",Sungjuk.class);
		data.writeSungJuk();

	}

}
