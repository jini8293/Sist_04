package info.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import myshop.data.MyShopDto;


@Controller
public class InfoController {

	@Autowired
	InfoDao dao;
	
	@GetMapping("/info/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		
		List<InfoDto> list = dao.getAllDatas();
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("info/infoList");
		
		return model;
	}
	
	@GetMapping("/info/writeform")
	public String writeform() {
		
		return "info/addForm";
	}
	
	@PostMapping("/info/insert")
	public String insert(@ModelAttribute("dto") InfoDto dto) {
		dao.insertInfo(dto);
		return "redirect:list";
	}
	
	@GetMapping("/info/updateform")
	public ModelAndView updateform(Integer num) {
		
		ModelAndView model = new ModelAndView();
		
		InfoDto dto = dao.getData(num);
		model.addObject("dto", dto);
		model.setViewName("info/updateForm");
		
		return model;
	}
	
	@PostMapping("/info/update")
	public String update(@ModelAttribute("dto") InfoDto dto) {
		dao.updateInfo(dto);
		return "redirect:list";
	}
	
	@GetMapping("/info/delete")
	public String delete(Integer num) {
		dao.deleteInfo(num);
		return "redirect:list";
	}
	
	
	
}
