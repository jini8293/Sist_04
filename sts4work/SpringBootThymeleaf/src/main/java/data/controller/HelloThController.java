package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloThController {

	@GetMapping("/")
	public String home() {
		return "home";
	}
}
