package boot.data.service;

import java.util.List;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {
	
	public int getTotalCount();
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllList(MemberDto dto);
	public int getSerchId(String id);
	public MemberDto getData(String num);
	public void updateMember(MemberDto dto);
	public void deleteMember(String num);

}
