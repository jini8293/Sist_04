package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {
	
	@Autowired
	MemberMapperInter mapper;

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	@Override
	public void insertMember(MemberDto dto) {
		mapper.insertMember(dto);
		
	}

	@Override
	public List<MemberDto> getAllList(MemberDto dto) {
		return mapper.getAllList(dto);
	}

	@Override
	public int getSerchId(String id) {
		return mapper.getSerchId(id);
	}

	@Override
	public String getName(String id) {
		return mapper.getName(id);
	}

	@Override
	public int loginCheck(String id, String pass) {
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		
		return mapper.loginCheck(map);
	}

	@Override
	public MemberDto getData(String id) {
		return mapper.getData(id);
	}
	
	
	
	
	
	
	
	
	
	

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(String num) {
		// TODO Auto-generated method stub
		
	}


}
