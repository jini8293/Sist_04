package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mdto") //이름 재지정 MarketDto를 가르킴
public class MarKetDto {
	

	   
	   private String num;
	   private String sang;
	   private int dan;
	   private String photoname;
	   private Timestamp ipgoday;



}
