package com.sist.anno2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("annoContext1.xml");
		
		Manggo mg = (ThaiManggo)context.getBean("tManggo");
		mg.writeManggoName();

	}

}
