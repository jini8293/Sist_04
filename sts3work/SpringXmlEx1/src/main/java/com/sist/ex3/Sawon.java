package com.sist.ex3;

public class Sawon {
	
	SawonData data;
	
	public Sawon(SawonData data) {
		this.data=data;
	}
	
	public void writeData() {
		System.out.println("사원명: "+data.sawonname);
		System.out.println("급여: "+data.getPay());
		System.out.println("입사일: "+data.getIpsaday());

	}

}
