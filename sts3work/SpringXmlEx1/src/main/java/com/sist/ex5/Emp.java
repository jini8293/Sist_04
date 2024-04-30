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
		System.out.println("**개인 정보**");
		System.out.println("회사명 | "+empname);
		System.out.println("회사위치 | "+emploc);
		System.out.println("사원명 | "+si.name);
		System.out.println("급여 | "+si.pay);
		System.out.println("직급 | "+si.position);
		
		System.out.println("부서종류");
		for (String h : si.buseo) {
			System.out.println("\t" + h);
		}
	}

}
