package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {
	
	public int getTotalCount();
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllList(MemberDto dto);
	public int getSerchId(String id);
	public String getName(String id);
	public int loginCheck(String id, String pass);
	public MemberDto getData(String id);
	
	
	
	
	
	public void updateMember(MemberDto dto);
	public void deleteMember(String num);

}
