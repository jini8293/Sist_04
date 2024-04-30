package com.sist.ex4;

public class Sungjuk {
	Student stu;
	private int kor;
	private int eng;
	private int mat;

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public void writeSungJuk() {
		System.out.println("기말고사");
		System.out.println("학생명: " + stu.getName());
		System.out.println("나이: " + stu.getAge());
		System.out.println("국어점수: " + kor);
		System.out.println("영어점수: " + eng);
		System.out.println("수학점수: " + mat);

		System.out.println("나의 취미들");
		for (String h : stu.getHobby()) {
			System.out.println("\t" + h);
		}

	}

}
