package com.sist.ex5;

public class Emp {

	SawonInfo si;
	String empname;
	String emploc;

	public Emp(String empname) {
		this.empname = empname;
	}

	public SawonInfo getSi() {
		return si;
	}

	public void setSi(SawonInfo si) {
		this.si = si;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getEmploc() {
		return emploc;
	}

	public void setEmploc(String emploc) {
		this.emploc = emploc;
	}
	
	public void writeEmp() {
		System.out.println("**���� ����**");
		System.out.println("ȸ��� | "+empname);
		System.out.println("ȸ����ġ | "+emploc);
		System.out.println("����� | "+si.name);
		System.out.println("�޿� | "+si.pay);
		System.out.println("���� | "+si.position);
		
		System.out.println("�μ�����");
		for (String h : si.buseo) {
			System.out.println("\t" + h);
		}
	}

}
