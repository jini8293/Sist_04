package com.sist.anno1;

import org.springframework.stereotype.Component;

@Component //�ڵ����� �� ���(id�� Ŭ���������� �ڵ����_ù���ڸ� �ҹ���_myDao�� ���̵� �ȴ�)
public class MyDao implements DaoInter {

	@Override
	public void insertData(String str) {
		System.out.println(str+"_������ db�� �߰� ����");

	}

	@Override
	public void deleteData(String num) {
		System.out.println(num+"_�� �ش��ϴ� ������ ���� ����");

	}

}
