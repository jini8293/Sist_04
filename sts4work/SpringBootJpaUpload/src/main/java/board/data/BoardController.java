package board.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao dao;
	
	@GetMapping("/")
	public String home() {
		return "redirect:board/list";
	}
	
	@GetMapping("board/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		
		List<BoardDto> list = dao.getAllData();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("board/boardList");
		
		return model;
	}
	
	@GetMapping("board/addform")
	public String addform() {
		
		return "board/writeForm";
	}
	
	@PostMapping("board/add")
	public String insert(@ModelAttribute("dto") BoardDto dto, @RequestParam MultipartFile upload,
			HttpSession session) {
		//실제경로
		String realPath = session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		String uploadName = upload.getOriginalFilename();
		
		if(upload.isEmpty()) {
			dto.setPhoto("no");
		}else {
			dto.setPhoto(uploadName);
			
			//실제업로드
			try {
				upload.transferTo(new File(realPath+"\\"+uploadName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		dao.insertBoard(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("board/detail")
	public ModelAndView detail(long num) {
		
		ModelAndView model = new ModelAndView();
		
		BoardDto dto = dao.getData(num);
		model.addObject("dto", dto);
		
		model.setViewName("board/detail");
		
		
		return model;
	}
	
	

}
