package product.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Alias("pdto")
public class ProductDto {
	
	private int num;
	private String name;
	private int price;
	private String image;
	private String color;
	private Timestamp createday;

}
