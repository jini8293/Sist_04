package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	@GetMapping("/member/list")
	public String list(@ModelAttribute("dto") MemberDto dto, Model model) {

		List<MemberDto> list = service.getAllList(dto);
		model.addAttribute("list", list);
		model.addAttribute("mcount", list.size());

		return "/member/memberlist";
	}

	@GetMapping("/member/form")
	public String form() {
		return "/member/memberform";
	}

	// id체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheckProcess(@RequestParam String id) {
		Map<String, Integer> map = new HashMap<>();

		// id체크 메서드 호출
		int n = service.getSerchId(id);
		map.put("count", n); // 1 or 0

		return map;
	}
	
	@PostMapping("member/insert")
	public String insert(@ModelAttribute("dto") MemberDto dto, @RequestParam MultipartFile myphoto,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/memberimage");
		System.out.println(path);

		if (myphoto.getOriginalFilename().equals("")) {
			dto.setPhoto(path);
		} else {
			String photoname = myphoto.getOriginalFilename();
			dto.setPhoto(photoname);

			try {
				myphoto.transferTo(new File(path + "\\" + photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		service.insertMember(dto);
		return "redirect:list";
	}
	
	@GetMapping("/member/myinfo")
	public String myinfo(@ModelAttribute("dto") MemberDto dto, Model model) {
		List<MemberDto> list = service.getAllList(dto);
		model.addAttribute("list", list);

		return "/member/memberinfo";
	}

}
