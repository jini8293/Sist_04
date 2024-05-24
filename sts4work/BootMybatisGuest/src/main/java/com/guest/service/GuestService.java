package com.guest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guest.dto.GuestDto;
import com.guest.mapper.GuestMapper;


@Service
public class GuestService {
	
	@Autowired
	GuestMapper mapper;
	
	
	public int getTotalCount() {
		return mapper.getTotalCount();		
	}
	
	public void insertGuest(GuestDto dto) {
		mapper.insertGuest(dto);
	}
	
	public List<GuestDto> getAllGuest(){
		return mapper.getAllGuest();
	}
	
	public void deleteGuest(int num) {
		mapper.deleteGuest(num);
	}
	
	public int CheckPass(int num, String pass){
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("pass", pass);
		
		int n = mapper.CheckPass(num, pass);
		
		return n;
	}

}
