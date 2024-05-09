package com.spring.dbtest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyshopDao implements MyshopDaoIn {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<MyshopDto> getAllList() {
		return session.selectList("getAllMyShop");
	}



}
