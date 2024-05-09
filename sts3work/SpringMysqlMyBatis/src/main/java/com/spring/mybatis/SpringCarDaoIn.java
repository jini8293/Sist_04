package com.spring.mybatis;

import java.util.List;

public interface SpringCarDaoIn {
	
	public List<SpringCarDto> getAllList();
	public int getTotalCount();
	public void insertMyCar(SpringCarDto dto);
	public SpringCarDto getData(String num);
	public void updateMyCar(SpringCarDto dto);
	public void deleteMyCar(String num);
}
