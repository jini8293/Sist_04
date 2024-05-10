package com.spring.board;

import java.util.List;

public interface BoardDaoIn {
	
		
		public int getTotalCount();
		public int getMaxNum();
		public void insertBoard(BoardDto dto);
		public List<BoardDto> getAllBoard();
		public BoardDto getOneData(int num);
		public void updateReadCount(int num);
		public List<BoardDto> getList(int start, int perPage);
}
