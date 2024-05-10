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
		
		list.add(new Photo("다크그레이가디건", "1.jpg"));
		list.add(new Photo("아이보리원피스", "2.jpg"));
		list.add(new Photo("블랙티셔츠", "3.jpg"));
		list.add(new Photo("다크네이비청바지", "4.jpg"));
		list.add(new Photo("베이지슬리브", "5.jpg"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sname", "없는 상품");
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
