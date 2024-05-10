package com.spring.member;

import java.util.HashMap;
import java.util.List;

public interface MemberDaoIn {
	
	public int getIdCheck(String id);
	public void insertMember(MemberDto dto);
	public int getTotalCount();
	public List<MemberDto> getAllMember();
	public MemberDto getOneMember(String num);
	public void updateMember(MemberDto dto);
	public int getPassCheck(String num, String pass);
	public void deleteMember(String num);
}
