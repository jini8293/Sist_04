package mycar.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.RequiredArgsConstructor;
import mycar.data.MyCarDto;
import mycar.repository.MyCarDao;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class MyCarController {

	private final MyCarDao dao;
	
	@GetMapping("/")
	public String start() {
		return "redirect:list";
	}

	@GetMapping("/list")
	public String home(Model model) {
		List<MyCarDto> list = dao.getAllCars();

		model.addAttribute("list", list);
		model.addAttribute("totalcount", list.size());

		return "mycar/mycarlist";
	}

	@GetMapping("/writeform")
	public String writeform() {
		return "mycar/mycarform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute("dto") MyCarDto dto, @RequestParam MultipartFile carupload, HttpSession session) {
		String realpath = session.getServletContext().getRealPath("/save");
		System.out.println(realpath);
		
		String uploadName = carupload.getOriginalFilename();
		dto.setCarphoto(uploadName);
		
		//실제 업로드
		try {
			carupload.transferTo(new File(realpath+"\\"+uploadName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		dao.insertMycar(dto);
		
		return "redirect:list";
	}

}
