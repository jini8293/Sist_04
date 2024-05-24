package com.guest.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("gdto")
public class GuestDto {
	
	private int num;
	private String nick;
	private String pass;
	private String photo;
	private String content;
	private int likes;
	private Timestamp writeday;

}
