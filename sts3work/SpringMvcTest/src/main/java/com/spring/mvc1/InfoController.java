package com.spring.mvc1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class InfoController {

	@GetMapping("/info/myform")
	public String myform() {
		return "info/infoform";
	}

	@PostMapping("/info/read")
	public String result(@ModelAttribute("dto") InfoDto dto) { //@ModelAttribute("dto")안해주면 InfoDto가 infoDto로 저장됨
		
		return "info/infowrite";

	}

}
