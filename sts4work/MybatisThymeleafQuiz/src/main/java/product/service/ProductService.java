package product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import product.dto.ProductDto;
import product.mapper.ProductMapper;

@Service
@AllArgsConstructor
public class ProductService {
	
	private ProductMapper mapper;
	
	public int getTotalCount() {
		return mapper.getTotalCount();	
	}
	
	public void insertProduct(ProductDto dto) {
		mapper.insertProduct(dto);
	}
	
	public List<ProductDto> getAllList(){
		return mapper.getAllList();		
	}
	
	public ProductDto getData(int num) {
		return mapper.getData(num);		
	}
	
	public void deleteProduct(int num) {
		mapper.deleteProduct(num);
	}

}
