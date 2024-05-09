package com.spring.mybatis;

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
@RequestMapping("/samsung")
public class CarController {

	@Autowired
	SpringCarDaoIn carIn;

	@GetMapping("/list")
	public String list(Model model) {

		// dao�� ���� �Ѱ��� ����
		int totalcount = carIn.getTotalCount();

		// ��ϰ�������
		List<SpringCarDto> list = carIn.getAllList();
		
		// request�� ����
		model.addAttribute("totalcount", totalcount);
		model.addAttribute("list",list);

		return "car/carlist";
	}

	@GetMapping("/writeform")
	public String insertform() {
		return "car/addform";
	}

	@PostMapping("/insertcar")
	public String insert(@ModelAttribute("dto") SpringCarDto dto) {

		carIn.insertMyCar(dto);

		return "redirect:list";
	}
	
	@GetMapping("/updateform")
	public String updateform(@RequestParam String num, Model model) {
		
		SpringCarDto dto = carIn.getData(num);
		model.addAttribute("dto",dto);
		return "car/updateform";
	}
	
	@PostMapping("/updatecar")
	public String update(@ModelAttribute("dto") SpringCarDto dto) {

		carIn.updateMyCar(dto);

		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam String num) {
		
		carIn.deleteMyCar(num);

		return "redirect:list";
	}

}
