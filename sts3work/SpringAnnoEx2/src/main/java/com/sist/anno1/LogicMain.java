package com.sist.anno1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("annoContext1.xml");
		
		LogicController logic1 = (LogicController)context.getBean("logic");
		logic1.insert("스프링 xml 배우는중");
		logic1.delete("3");

	}

}
