package com.sist.ex3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class SawonMain {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext3.xml");
		
		Sawon data = context.getBean("sawon", Sawon.class);
		data.writeData();

	}

}
