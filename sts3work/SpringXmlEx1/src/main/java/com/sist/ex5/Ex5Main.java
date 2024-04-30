package com.sist.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex5Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext5.xml");
		
		Emp emp = context.getBean("emp", Emp.class);
		emp.writeEmp();

	}

}
