package com.sist.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OrderController {
	
	@Autowired
	ShopDaoInter shopInter;
	
	int cnt = 20;
	String name="주문자";
	
	public void jumunInsert(String sang, int price, String color) {
		shopInter.insertShop(sang, price, color);
		System.out.println(name+"님이 "+cnt+"개를 주문 완료.");
	}
	
	public void jumunDelete(String num) {
		shopInter.deleteShop(num);
		System.out.println(num+"번 삭제 완료");
	}
	
	public void jumunSelect(String sang, int price, String color) {
		shopInter.selectShop(sang, price, color);
		System.out.println(name+"님이 주문하신 상품");
		System.out.println("제품명 | "+sang);
		System.out.println("가격 | "+price);
		System.out.println("색상 | "+color);
		System.out.println("갯수 | "+cnt);
	}
	

}
