package com.sist.anno1;

import org.springframework.stereotype.Component;

@Component //자동으로 빈에 등록(id가 클래스명으로 자동등록_첫글자만 소문자_myDao가 아이디가 된다)
public class MyDao implements DaoInter {

	@Override
	public void insertData(String str) {
		System.out.println(str+"_데이터 db에 추가 성공");

	}

	@Override
	public void deleteData(String num) {
		System.out.println(num+"_에 해당하는 데이터 삭제 성공");

	}

}
