package com.guest.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.guest.dto.GuestDto;


@Mapper
public interface GuestMapper {
	
	public int getTotalCount();
	public void insertGuest(GuestDto dto);
	public List<GuestDto> getAllGuest();
	public void deleteGuest(int num);
	public int CheckPass(int num, String pass);
}
