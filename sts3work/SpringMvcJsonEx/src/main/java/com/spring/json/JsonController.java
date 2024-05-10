package com.spring.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;

import com.spring.data.Photo;

@RestController
public class JsonController {
	
	@GetMapping("/list3")
	public Map<String, Object> list3(@RequestParam String sname){
		List<Photo> list = new ArrayList<Photo>();
		
		list.add(new Photo("��ũ�׷��̰����", "1.jpg"));
		list.add(new Photo("���̺������ǽ�", "2.jpg"));
		list.add(new Photo("��Ƽ����", "3.jpg"));
		list.add(new Photo("��ũ���̺�û����", "4.jpg"));
		list.add(new Photo("������������", "5.jpg"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sname", "���� ��ǰ");
		map.put("photo", "6.jpg");
		
		for(Photo dto:list) {
			if(sname.equals(dto.getSangname()))
			{
				map.put("sname", dto.getSangname());
				map.put("photo", dto.getPhoto());
			}
		}
		return map;
		
		
	}

}
