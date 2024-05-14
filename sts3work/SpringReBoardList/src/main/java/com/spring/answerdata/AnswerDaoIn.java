package com.spring.answerdata;

import java.util.List;

public interface AnswerDaoIn {
	
	public void insertAnswer(AnswerDto dto);
	public List<AnswerDto> getAnswerList(int num);
	public int getCheckPass(int idx, String pass);
	public void deleteAnswer(int idx);

	
}
