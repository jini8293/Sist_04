package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
	
	@GetMapping("/load/map")
	public String list() {
		return "/load/loadmap";
	}

}
