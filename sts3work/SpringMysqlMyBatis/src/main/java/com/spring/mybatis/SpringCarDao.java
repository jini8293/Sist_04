package com.spring.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpringCarDao implements SpringCarDaoIn {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<SpringCarDto> getAllList() {
		return session.selectList("getAllMyCar");
	}
	
	@Override
	public int getTotalCount() {
		return session.selectOne("totalcountCar");
	}

	@Override
	public void insertMyCar(SpringCarDto dto) {
		session.insert("insertMyCar",dto);
	}

	@Override
	public SpringCarDto getData(String num) {
		return session.selectOne("selectOneCar", num);
	}

	@Override
	public void updateMyCar(SpringCarDto dto) {
		session.update("updateMyCar", dto);
		
	}

	@Override
	public void deleteMyCar(String num) {
		session.delete("deleteMyCar", num);
	}


}
