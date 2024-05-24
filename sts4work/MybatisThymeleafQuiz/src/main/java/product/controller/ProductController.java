package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import product.dto.ProductDto;
import product.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@GetMapping("/")
	public String home() {
		
		return "redirect:product/list";
	}
	
	@GetMapping("/product/list")
	private String list(Model model) {
		
		List<ProductDto> list = service.getAllList();
		model.addAttribute("list", list);
		
		return "product/productlist";
	}
	
	@GetMapping("/product/addform")
	public String addform() {
		return "product/addform";
	}

	@PostMapping("/product/insert")
	public String insert(@ModelAttribute("dto") ProductDto dto, HttpSession session, @RequestParam MultipartFile upload) {
		String realpath = session.getServletContext().getRealPath("/productimage");
		System.out.println(realpath);
		
		String uploadName = upload.getOriginalFilename();
		dto.setImage(uploadName);
		
		//실제 업로드
		try {
			upload.transferTo(new File(realpath+"\\"+uploadName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.insertProduct(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/product/detail")
	public String detail(@RequestParam int num, Model model) {
		ProductDto dto = service.getData(num);
		model.addAttribute("dto", dto);
		return "product/productdetail";
	}
	
	

}
