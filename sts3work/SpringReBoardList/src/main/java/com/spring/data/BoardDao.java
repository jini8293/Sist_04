package com.spring.data;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoIn {

	@Autowired
	SqlSession session;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("TotalCountOfBoard");
	}

	@Override
	public int getMaxNum() {
		return session.selectOne("MaxNumOfBoard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {

		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("regroup", regroup);
		map.put("restep", restep);

		session.update("UpdateStepOfBoard", map);

	}

	@Override
	public void insertBoard(BoardDto dto) {
		int num = dto.getNum(); // 0:새글 1보다 큰값:답글
		int regroup = dto.getRegroup();
		int restep = dto.getRestep();
		int relevel = dto.getRelevel();

		if (num == 0) {
			regroup = getMaxNum() + 1;
			restep = 0;
			relevel = 0;
		}else { //답글일때
			//같은 그룹중 전달받은 restep보다 큰 글들은 +1
			this.updateRestep(regroup, restep);
			
			//전달받은 step level +1
			restep++;
			relevel++;
		}
		//바뀐값들 다시 dto담기
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		session.insert("insertOfBoard", dto);

	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("perpage", perpage);

		
		return session.selectList("selectPagingListOfBoard", map);
	}

	@Override
	public void updateReadCount(int num) {
		session.update("UpdateReadCountOfBoard", num);
		
	}

	@Override
	public BoardDto getOneData(int num) {
		return session.selectOne("getDataOfBoard", num);
	}

	@Override
	public int getCheckPass(int num, int pass) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("num", num);
		map.put("pass", pass);

		
		return session.selectOne("CheckPassBoard", map);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		session.update("updateBoard",dto);
	}

	@Override
	public void deleteBoard(int num) {
		session.delete("deleteBoard",num);
	}


}
