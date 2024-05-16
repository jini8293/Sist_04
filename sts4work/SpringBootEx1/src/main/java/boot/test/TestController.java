package boot.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.ex1.TestDto;

@RestController
public class TestController {
	
	@GetMapping("/test")
	public TestDto hello() {
		TestDto dto = new TestDto();
		dto.setName("김지은");
		dto.setAddr("용인시");
		
		return dto;
	}

}
