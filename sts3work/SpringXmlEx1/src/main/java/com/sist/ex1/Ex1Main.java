package com.sist.ex1;

import javax.security.auth.login.AppConfigurationEntry;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex1Main {
	
	public static void main(String[] args) {
		System.out.println("1.�ڹٹ�� ������ ȣ��");
		
		MessageInter m1 = new Message1();
		m1.sayHello("������");
		
		MessageInter m2 = new Message2();
		m1.sayHello("��̾�");
		
		System.out.println("2.������ ��� ȣ��");
		ApplicationContext context = new ClassPathXmlApplicationContext("appContext.xml");
		
		MessageInter m3 = (Message1)context.getBean("msgBean1");
		m3.sayHello("������");
		
		MessageInter m4 = context.getBean("msgBean2",Message2.class);
		m4.sayHello("��̾�");

	}

}
