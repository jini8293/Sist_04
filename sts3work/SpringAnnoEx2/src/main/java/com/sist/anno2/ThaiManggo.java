package com.sist.anno2;

import org.springframework.stereotype.Component;

@Component("tManggo")
public class ThaiManggo implements Manggo {
	

	@Override
	public void writeManggoName() {
		System.out.println("���� �����ϴ� �±� ����.");

	}

}
