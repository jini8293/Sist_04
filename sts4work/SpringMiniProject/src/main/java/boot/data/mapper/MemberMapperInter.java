package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;



@Mapper
public interface MemberMapperInter {
	
	public int getTotalCount();
	public void insertMember(MemberDto dto);
	public List<MemberDto> getAllList(MemberDto dto);
	public int getSerchId(String id);
	public String getName(String id);
	public int loginCheck(Map<String, String> map);
	public MemberDto getData(String id);
	
	
	
	
	
	public void updateMember(MemberDto dto);
	public void deleteMember(String num);
}
