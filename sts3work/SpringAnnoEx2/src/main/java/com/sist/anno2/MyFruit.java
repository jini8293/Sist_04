package com.sist.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	//@Autowired//�������̽��� ������ Ŭ������ �Ѱ��� ���� �ڵ������� �Ǵµ� ���� ������ Ŭ������ 2���̻��̸� �ڵ����Կ� ������ ����
	//��Ȯ�ϰ� bean�� �̸����� �����Ϸ���..
	@Resource(name = "tManggo")
	//@Resource(name = "vietnamManggo")
	Manggo mg;
	
	
	
	public void wrtieManggo() {
		System.out.println("***���� �����ϴ� �����***");
		mg.writeManggoName();
	}

}
