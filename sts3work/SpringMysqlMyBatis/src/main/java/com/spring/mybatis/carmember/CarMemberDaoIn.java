package com.spring.mybatis.carmember;

import java.util.List;

public interface CarMemberDaoIn {
	
	public List<CarMemberDto> getAllList();
	public int getTotalCount();
	public void insertCarMember(CarMemberDto dto);
	public CarMemberDto getData(String num);
	public void updateCarMemder(CarMemberDto dto);
	public void deleteCarMemder(String num);

}
