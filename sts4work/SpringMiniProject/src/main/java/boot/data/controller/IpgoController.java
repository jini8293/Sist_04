package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {
	
	@Autowired
	IpgoMapperInter mapper;
	
	@GetMapping("/")
	public String home() {
		return "/layout/main";
	}
	
	@GetMapping("/ipgo/list")
	public String list(Model model, @ModelAttribute("dto") IpgoDto dto) {
		
		int totalCount = mapper.getTotalCount();
		model.addAttribute("totalCount",totalCount);
		
		List<IpgoDto> list = mapper.getAllList(dto);
		
		model.addAttribute("list", list);
		
		return "/ipgo/ipgolist";
	}
	
	@GetMapping("/ipgo/writeform")
	public String writeform() {
		
		return "/ipgo/ipgoform";
	}
	
	@PostMapping("ipgo/insert")
	public String insert(@ModelAttribute("dto") IpgoDto dto, @RequestParam MultipartFile upload,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/ipgoimage");
		System.out.println(path);

		if (upload.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		} else {
			String photoname = upload.getOriginalFilename();
			dto.setPhotoname(photoname);

			try {
				upload.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertIpgo(dto);
		return "redirect:list";
	}
	
	@GetMapping("/ipgo/updateform")
	public String updateform(@RequestParam String num, Model model) {
				
		IpgoDto dto = mapper.getData(num);
		model.addAttribute("dto", dto);
		
		return "/ipgo/updateform";
	}
	
	@PostMapping("ipgo/update")
	public String update(@ModelAttribute("dto") IpgoDto dto, @RequestParam MultipartFile upload,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/ipgoimage");
		System.out.println(path);

		if (upload.getOriginalFilename().equals("")) {
			dto.setPhotoname("no");
		} else {
			String photoname = upload.getOriginalFilename();
			dto.setPhotoname(photoname);

			try {
				upload.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.updateIpgo(dto);
		return "redirect:list";
	}
	
	@GetMapping("/ipgo/delete")
	public String delete(@RequestParam String num) {
		
		mapper.deleteIpgo(num);
		
		return "redirect:list";
	}
	

}
