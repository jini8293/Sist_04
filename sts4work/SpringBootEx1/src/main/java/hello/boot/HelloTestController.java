package hello.boot;

import java.util.List;
import java.util.Vector;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloTestController {

	@GetMapping("/shop/list")
	public List<ShopDto> list() {
		List<ShopDto> list = new Vector<>();

		ShopDto s1 = new ShopDto();

		s1.setShop("과일");
		s1.setSu(20);
		s1.setDan(250000);

		ShopDto s2 = new ShopDto();

		s2.setShop("요가매트");
		s2.setSu(10);
		s2.setDan(180000);
		
		list.add(s1);
		list.add(s2);
		
		return list;
	}
}
