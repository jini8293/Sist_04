package com.spring.answerdata;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDao implements AnswerDaoIn {
	
	@Autowired
	private SqlSession session;

	@Override
	public void insertAnswer(AnswerDto dto) {
		session.insert("insertOfAnswer",dto);
	}

	@Override
	public List<AnswerDto> getAnswerList(int num) {
		return session.selectList("selectOfAnswer", num);
	}

	@Override
	public int getCheckPass(int idx, String pass) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("idx", idx);
		map.put("pass", pass);

		
		return session.selectOne("CheckPassAnswer", map);
	}

	@Override
	public void deleteAnswer(int idx) {
		session.delete("deleteAnswer",idx);
	}

}
