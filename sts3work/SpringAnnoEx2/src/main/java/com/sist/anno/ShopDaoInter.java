package com.sist.anno;

public interface ShopDaoInter {
	
	public void insertShop(String sangpum, int price, String color);
	public void deleteShop(String num);
	public void selectShop(String sangpum, int price, String color);
}
