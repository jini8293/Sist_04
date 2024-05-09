package com.spring.mybatis.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberDaoIn {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<CarMemberDto> getAllList() {
		return session.selectList("getAllCarMember");
	}

	@Override
	public int getTotalCount() {
		return session.selectOne("totalcountMember");
	}

	@Override
	public void insertCarMember(CarMemberDto dto) {
		session.insert("insertCarMember", dto);
	}

	@Override
	public CarMemberDto getData(String num) {
		return session.selectOne("selectOneMember", num);
	}

	@Override
	public void updateCarMemder(CarMemberDto dto) {
		session.update("updateCarMember", dto);
	}

	@Override
	public void deleteCarMemder(String num) {
		session.delete("deleteCarMember", num);
	}

}
