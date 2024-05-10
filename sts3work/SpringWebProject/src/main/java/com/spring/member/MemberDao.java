package com.spring.member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao implements MemberDaoIn {
	
	@Autowired
	private SqlSession session;

	@Override
	public int getIdCheck(String id) {
		return session.selectOne("idCheckOfMember",id);
	}

	@Override
	public void insertMember(MemberDto dto) {
		session.insert("insertMember", dto);
	}

	@Override
	public int getTotalCount() {
		return session.selectOne("totalcountMember");
	}

	@Override
	public List<MemberDto> getAllMember() {
		return session.selectList("getAllMember");
	}

	@Override
	public MemberDto getOneMember(String num) {
		return session.selectOne("selectOneMember",num);
	}

	@Override
	public void updateMember(MemberDto dto) {
		session.update("updateMember",dto);
		
	}

	@Override
	public int getPassCheck(String num, String pass) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("num", num);
		map.put("pass", pass);
		
		return session.selectOne("passCheckMember",map);
	}

	@Override
	public void deleteMember(String num) {
		session.delete("deleteMember",num);
		
	}
	
	

}
