package myshop.data;

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
}
