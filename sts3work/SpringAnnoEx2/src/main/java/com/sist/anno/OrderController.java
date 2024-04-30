package com.sist.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OrderController {
	
	@Autowired
	ShopDaoInter shopInter;
	
	int cnt = 20;
	String name="�ֹ���";
	
	public void jumunInsert(String sang, int price, String color) {
		shopInter.insertShop(sang, price, color);
		System.out.println(name+"���� "+cnt+"���� �ֹ� �Ϸ�.");
	}
	
	public void jumunDelete(String num) {
		shopInter.deleteShop(num);
		System.out.println(num+"�� ���� �Ϸ�");
	}
	
	public void jumunSelect(String sang, int price, String color) {
		shopInter.selectShop(sang, price, color);
		System.out.println(name+"���� �ֹ��Ͻ� ��ǰ");
		System.out.println("��ǰ�� | "+sang);
		System.out.println("���� | "+price);
		System.out.println("���� | "+color);
		System.out.println("���� | "+cnt);
	}
	

}
