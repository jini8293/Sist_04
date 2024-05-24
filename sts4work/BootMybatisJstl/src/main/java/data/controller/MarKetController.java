package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MarKetDto;
import data.mapper.MarKetMapperInter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MarKetController {

	@Autowired
	MarKetMapperInter mapper;

	@GetMapping("/")
	public String start() {
		return "redirect:book/list";
	}
	
	

	@GetMapping("/market/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		model.setViewName("market/marketlist");

		int totalCount = mapper.getTotalCount();

		List<MarKetDto> list = mapper.getAllDatas();

		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.addObject("count", list.size());

		return model;
	}

	@GetMapping("/market/addform")
	public String addform() {

		return "market/addform";
	}

	@PostMapping("/market/insert")
	public String insert(@ModelAttribute("dto") MarKetDto dto, @RequestParam MultipartFile photo,
			HttpServletRequest request) {

		String path = request.getServletContext().getRealPath("/photo");
		System.out.println(path);

		if (photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname = sdf.format(new Date()) + photo.getOriginalFilename();
			dto.setPhotoname(photoname);

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
		mapper.insertMarket(dto);
		return "redirect:list";
	}

	@GetMapping("/market/updateform")
	public String updateform(@RequestParam String num, Model model) {

		MarKetDto dto = mapper.getData(num);
		model.addAttribute("dto", dto);

		return "market/updateform";
	}
	
	@PostMapping("/market/update")
	public String update(@ModelAttribute("dto") MarKetDto dto, @RequestParam MultipartFile photo,
			HttpServletRequest request) {
		
		String path = request.getServletContext().getRealPath("/photo");
		System.out.println(path);

		if (photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		} else {
			
			//수정전에 이전사진 지우기
			String pre_photo = mapper.getData(dto.getNum()).getPhotoname();
			File file = new File(path+"\\"+pre_photo);
			
			if(file.exists()) {
				file.delete();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String photoname = sdf.format(new Date()) + photo.getOriginalFilename();
			dto.setPhotoname(photoname);

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
		
		mapper.updateMarket(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num, HttpSession session) {
		
		String photo = mapper.getData(num).getPhotoname();
		if(photo!=null) {
			String path = session.getServletContext().getRealPath("/photo");
			
			File file = new File(path+"\\"+photo);
			
			if(file.exists()) {
				file.delete();
			}
		}
		
		mapper.deleteMatket(num);
		return "redirect:list";
	}
	

}
