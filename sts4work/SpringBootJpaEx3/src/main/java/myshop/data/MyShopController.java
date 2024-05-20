package myshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MyShopController {
	
	@Autowired
	MyShopDao dao;
	
	@GetMapping("/")
	public String start() {
		return "index";
	}
	
	@GetMapping("/shop/list")
	public ModelAndView getMethodName() {
		ModelAndView model = new ModelAndView();
		
		List<MyShopDto> list = dao.getAllSangpums();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("myshop/shopList");
		return model;
	}
	
	@GetMapping("/shop/writeform")
	public String addform() {
		return "myshop/addForm";
	}
	
	@PostMapping("/shop/insert")
	public String insert(@ModelAttribute("dto") MyShopDto dto) {
		
		dao.insertShop(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/shop/updateform")
	public ModelAndView updateform(long num) {
		ModelAndView model = new ModelAndView();
		
		MyShopDto dto = dao.getData(num);
		model.addObject("dto", dto);
		model.setViewName("myshop/updateForm");
		
		return model;
	}
	
	@PostMapping("/shop/update")
	public String update(@ModelAttribute("dto") MyShopDto dto) {
		dao.updateShop(dto);
		return "redirect:list";
	}
	
	@GetMapping("/shop/delete")
	public String delete(long num) {
		dao.deleteShop(num);
		return "redirect:list";
	}
	
	

}
