package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("bdto")
public class BookDto {
	
	private String num;
	private String bookname;
	private String writer;
	private int bookprice;
	private String bookimage;
	private String bookcompany;
	private Timestamp ipgoday;

}
