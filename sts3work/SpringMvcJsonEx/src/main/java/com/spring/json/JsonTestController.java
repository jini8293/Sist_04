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

		map.put("name", "������");
		map.put("hp", "010-2984-2593");
		map.put("addr", "����� ������");

		return map;

	}

	@GetMapping("/list2")
	@ResponseBody
	public List<Photo> list2(){
	
		List<Photo> list = new ArrayList<Photo>();
	
		list.add(new Photo("��ũ�׷��� �����", "1.jpg"));
		list.add(new Photo("���̺��� ���ǽ�", "2.jpg"));
		list.add(new Photo("�� Ƽ����", "3.jpg"));
		list.add(new Photo("��ũ���̺� û����", "4.jpg"));
		list.add(new Photo("������ ������", "5.jpg"));
		
		return list;

	}
}
