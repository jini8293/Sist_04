package com.spring.mybatis.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/carmember")
public class CarMemberController {
	
	@Autowired
	CarMemberDaoIn carmIn;
	
	@GetMapping("/list")
	public String list(Model model) {

		// dao로 부터 총갯수 저장
		int totalcount = carmIn.getTotalCount();

		// 목록가져오기
		List<CarMemberDto> list = carmIn.getAllList();
		
		// request에 저장
		model.addAttribute("totalcount", totalcount);
		model.addAttribute("list",list);

		return "carmember/carmemberlist";
	}

	@GetMapping("/writeform")
	public String insertform() {
		return "carmember/addform";
	}

	@PostMapping("/insertmember")
	public String insert(@ModelAttribute("dto") CarMemberDto dto) {

		carmIn.insertCarMember(dto);

		return "redirect:list";
	}
	
	@GetMapping("/updateform")
	public String updateform(@RequestParam String num, Model model) {
		
		CarMemberDto dto = carmIn.getData(num);
		model.addAttribute("dto",dto);
		return "carmember/updateform";
	}
	
	@PostMapping("/updatemember")
	public String update(@ModelAttribute("dto") CarMemberDto dto) {

		carmIn.updateCarMemder(dto);

		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String num) {
		
		carmIn.deleteCarMemder(num);

		return "redirect:list";
	}

}
