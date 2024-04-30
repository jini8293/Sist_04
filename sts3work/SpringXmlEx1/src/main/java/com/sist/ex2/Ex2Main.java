package com.sist.ex2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext2.xml");
		
		//MyInfo
		MyInfo my = (MyInfo)context.getBean("my");
		System.out.println(my); //toString() 은 생략시 자동호출되는 메서든
		
		//Person
		Person ps = (Person) context.getBean("person");
		ps.wrtieData();

	}

}
