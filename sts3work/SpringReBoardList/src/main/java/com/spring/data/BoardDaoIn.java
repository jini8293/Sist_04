package com.spring.data;

import java.util.List;

public interface BoardDaoIn {
	
	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup, int restep);
	public void insertBoard(BoardDto dto);
	public List<BoardDto> getList(int start, int perpage);
	public void updateReadCount(int num);
	public BoardDto getOneData(int num);
	public int getCheckPass(int num, int pass);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(int num);

}
