package com.sist.ex3;

public class SawonData {

	String sawonname;
	private int pay;
	private String ipsaday;


	public SawonData(String name) {
		sawonname = name;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getIpsaday() {
		return ipsaday;
	}

	public void setIpsaday(String ipsaday) {
		this.ipsaday = ipsaday;
	}

}
