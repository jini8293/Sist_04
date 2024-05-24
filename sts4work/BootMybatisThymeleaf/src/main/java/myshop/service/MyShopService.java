package myshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import myshop.dto.MyShopDto;
import myshop.mapper.MyShopMapper;

@Service
@AllArgsConstructor
public class MyShopService {

	private final MyShopMapper mapper;

	public int getTotalCount() {
		return mapper.getTotalCount();

	}

	public void insertShop(MyShopDto dto) {
		mapper.insertShop(dto);
	}
	
	public List<MyShopDto> getAllSangPums(){
		return mapper.getAllSangPums();
	}

}
