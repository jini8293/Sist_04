package boot.data.service;

import java.util.List;

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
	public MemberDto getData(String num) {
		return mapper.getData(num);
	}

	@Override
	public void updateMember(MemberDto dto) {
		mapper.updateMember(dto);
		
	}

	@Override
	public void deleteMember(String num) {
		mapper.deleteMember(num);
		
	}

}
