package com.spring.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoIn {

	@Autowired
	private SqlSession session;

	@Override
	public int getTotalCount() {
		return session.selectOne("totalcountBoard");
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne("maxNumBoard");
	}

	@Override
	public void insertBoard(BoardDto dto) {
		session.insert("insertBoard", dto);

	}

	@Override
	public List<BoardDto> getAllBoard() {
		return session.selectList("selectAllBoard");
	}

	@Override
	public BoardDto getOneData(int num) {
		return session.selectOne("selectOneBoard", num);
	}

	@Override
	public void updateReadCount(int num) {
		session.update("updateReadCountBoard", num);

	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("perpage", perpage);

		return session.selectList("selectPagingListOfMember", map);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		session.update("updateBoard", dto);
		
	}

	@Override
	public void deleteBoard(int num) {
		session.delete("deleteBoard", num);
		
	}

	@Override
	public List<BoardDto> getPhotoLists() {
		return session.selectList("selectPhotoOfBoard");
	}

}
