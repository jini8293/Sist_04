package boot.data.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;



@Mapper
public interface MemberMapperInter {
	
	public int getTotalCount();
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllList(MemberDto dto);
	public int getSerchId(String id);
	public MemberDto getData(String num);
	public void updateMember(MemberDto dto);
	public void deleteMember(String num);
}
