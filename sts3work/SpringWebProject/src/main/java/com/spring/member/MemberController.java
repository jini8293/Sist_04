package com.spring.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/member")
public class MemberController {

	 @Autowired 
	 MemberDaoIn memIn;

	
	@GetMapping("/list")
	public String list(Model model) {
		
		int totalcount = memIn.getTotalCount();
		
		List<MemberDto> list = memIn.getAllMember();
		
		model.addAttribute("totalcount",totalcount);
		model.addAttribute("list",list);
		
		return "member/memberList";
	}
	
	@GetMapping("/addform")
	public String addform() {
		return "member/addForm";
	}
	
	@GetMapping("/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheck(@RequestParam String id){
		Map<String, Integer> map = new HashMap<String, Integer>();
		int count = memIn.getIdCheck(id);
		
		map.put("count", count);
		
		return map;		
	}
	
	@PostMapping("/insertmember")
	public String insertMember(@ModelAttribute("dto") MemberDto dto) {
		
		memIn.insertMember(dto);
		
		return "redirect:list";	
	}
	
	@GetMapping("/updateForm")
	public ModelAndView updateform(@RequestParam String num) {
		ModelAndView model = new ModelAndView();
		
		MemberDto dto = memIn.getOneMember(num);
		model.addObject("dto",dto);
		model.setViewName("member/updateForm");
		
		return model;
	}
	
	@PostMapping("/updatemember")
	public String updatemember(@ModelAttribute("dto") MemberDto dto) {
		
		//비번이 맞는지 체크
		int n  = memIn.getPassCheck(dto.getNum(), dto.getPass());
		
		if(n==1) {
			memIn.updateMember(dto);
			return "redirect:list";	
		}else {
			return "member/passFail";
		}

	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String num) {
		
		memIn.deleteMember(num);

		return "redirect:list";
	}
	
	


}
