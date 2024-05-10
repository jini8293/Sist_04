package com.spring.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.data.Photo;

@Controller
public class JsonTestController {

	@GetMapping("/list1")
	@ResponseBody
	public Map<String, String> list1() {
		Map<String, String> map = new HashMap<String, String>();

		map.put("name", "최유리");
		map.put("hp", "010-2984-2593");
		map.put("addr", "서울시 강남구");

		return map;

	}

	@GetMapping("/list2")
	@ResponseBody
	public List<Photo> list2(){
	
		List<Photo> list = new ArrayList<Photo>();
	
		list.add(new Photo("다크그레이 가디건", "1.jpg"));
		list.add(new Photo("아이보리 원피스", "2.jpg"));
		list.add(new Photo("블랙 티셔츠", "3.jpg"));
		list.add(new Photo("다크네이비 청바지", "4.jpg"));
		list.add(new Photo("베이지 슬리브", "5.jpg"));
		
		return list;

	}
}
