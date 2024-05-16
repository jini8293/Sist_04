package sist.boot;

import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class HiController {

	@GetMapping("/sist/hi")
	public HashMap<String, String> h1() {

		HashMap<String, String> data = new HashMap<>();

		data.put("message", "Have a nice day");

		return data;
	}

}
