package com.sist.ex3;

public class Sawon {
	
	SawonData data;
	
	public Sawon(SawonData data) {
		this.data=data;
	}
	
	public void writeData() {
		System.out.println("�����: "+data.sawonname);
		System.out.println("�޿�: "+data.getPay());
		System.out.println("�Ի���: "+data.getIpsaday());

	}

}
