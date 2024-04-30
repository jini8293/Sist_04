package com.sist.anno;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class JumunMain {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("annoContext1.xml");
		
		OrderController order = (OrderController)context.getBean("orderController");
		order.jumunInsert("�䰡��Ʈ", 35000, "Black");
		order.jumunDelete("2");
		order.jumunSelect("�䰡��Ʈ", 35000, "Black");

	}

}
