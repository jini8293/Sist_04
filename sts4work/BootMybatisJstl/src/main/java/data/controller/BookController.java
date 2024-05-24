package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.BookDto;
import data.mapper.BookMapperInter;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BookController {
	
	@Autowired
	BookMapperInter mapper;
	
	@GetMapping("/book/list")
	public ModelAndView booklist() {
		ModelAndView model = new ModelAndView();
		model.setViewName("book/booklist");

		int totalCount = mapper.getTotalCount();

		List<BookDto> list = mapper.getAllDatas();

		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("count", list.size());

		return model;
	}
	
	@GetMapping("/book/addform")
	public String addform() {
		return "book/addform";
	}
	
	@PostMapping("/book/insert")
	public String insert(@ModelAttribute("dto") BookDto dto, @RequestParam MultipartFile photo,
			HttpServletRequest request) {
		
		String path = request.getServletContext().getRealPath("/photo");
		System.out.println(path);

		if (photo.getOriginalFilename().equals("")) {
			dto.setBookimage("no");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname = sdf.format(new Date()) + photo.getOriginalFilename();
			dto.setBookimage(photoname);

			try {
				photo.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertBook(dto);
		return "redirect:list";
	}

}
