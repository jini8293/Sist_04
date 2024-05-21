package mycar.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.RequiredArgsConstructor;
import mycar.data.MyCarCommentDto;
import mycar.data.MyCarDto;
import mycar.repository.MyCarCommentDao;
import mycar.repository.MyCarDao;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequiredArgsConstructor
public class MyCarController {

	private final MyCarDao dao;
	private final MyCarCommentDao cdao;
	
	@GetMapping("/")
	public String start() {
		return "redirect:list";
	}

	@GetMapping("/list")
	public String home(Model model) {
		List<MyCarDto> list = dao.getAllCars();
		
		for(MyCarDto dto:list)
		{
			//댓글갯수저장
			int acount=cdao.getMyCarCommentList(dto.getNum()).size();
			dto.setCommentcount(acount);
		}

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
	
	@GetMapping("/detail")
	public String detail(@RequestParam Long num, Model model) {
		MyCarDto dto = dao.getData(num);
		model.addAttribute("dto", dto);
		return "mycar/mycardetail";
	}
	
	@GetMapping("/updateform")
	public String updateform(@RequestParam Long num, Model model) {
		MyCarDto dto = dao.getData(num);
		model.addAttribute("dto", dto);
		return "mycar/updateform";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam Long num, HttpSession session) {
		
		String carphoto = dao.getData(num).getCarphoto();
		String realPath = session.getServletContext().getRealPath("/save");
		
		//파일 객체 생성후 삭제
		File file = new File(realPath+"\\"+carphoto);
		if(file.exists()) {
			file.delete();
		}
		
		//db삭제
		dao.deleteMycar(num);
		return "redirect:list";
	}
	
	//수정
	@PostMapping("/update")
	public String update(@ModelAttribute("dto") MyCarDto dto, @RequestParam MultipartFile upload, HttpSession session) {
		if(upload.getOriginalFilename().equals("")) {
			dao.updateMycarNoPhoto(dto);
		}else {
			String realpath = session.getServletContext().getRealPath("/save");
			System.out.println(realpath);
			
			String uploadName = upload.getOriginalFilename();
			dto.setCarphoto(uploadName);
			
			//실제 업로드
			try {
				upload.transferTo(new File(realpath+"\\"+uploadName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			dao.updateMycar(dto);
		}

		
		return "redirect:detail?num="+dto.getNum();
	}
	

}
