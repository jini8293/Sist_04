package myshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.RequiredArgsConstructor;
import myshop.dto.MyShopDto;
import myshop.service.MyShopService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;



@Controller
@RequiredArgsConstructor
public class MyShopController {
	
	private final MyShopService service;

	
	@GetMapping("/")
	public String list(Model model) {
		
		int totalCount = service.getTotalCount();
		List<MyShopDto> list = service.getAllSangPums();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		return "myshop/shoplist";
	}
	
	@GetMapping("/addform")
	public String addform() {
		return "myshop/shopform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute("dto") MyShopDto dto, @RequestParam MultipartFile upload, HttpSession session) {
		String realpath = session.getServletContext().getRealPath("/photo");
		System.out.println(realpath);
		
		String uploadName = upload.getOriginalFilename();
		dto.setPhoto(uploadName);
		
		//실제 업로드
		try {
			upload.transferTo(new File(realpath+"\\"+uploadName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.insertShop(dto);
		
		return "redirect:/";
	}
	
	

}
