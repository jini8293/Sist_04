package myshop.data;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyShopDao {

	@Autowired
	MyShopDaoInter daoIn;
	
	//insert
	public void insertShop(MyShopDto dto) {
		daoIn.save(dto); //id타입 유무에 따라 자동으로 insert, update
	}
	
	//selectAll
	public List<MyShopDto> getAllSangpums(){
		return daoIn.findAll();
	}
	
	//selectOne
	public MyShopDto getData(long num) {
		return daoIn.getReferenceById(num);
	}
	
	//update
	public void updateShop(MyShopDto dto) {
		daoIn.save(dto); //num이 포함되어있으므로 수정이됨
	}
	
	//delete
	public void deleteShop(long num) {
		daoIn.deleteById(num);
	}
}
