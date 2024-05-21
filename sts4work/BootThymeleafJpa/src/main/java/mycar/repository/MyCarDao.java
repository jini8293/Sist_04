package mycar.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import mycar.data.MyCarDto;

@Repository
@AllArgsConstructor
public class MyCarDao {

	MyCarDaoInter daoIn;
	
	//db저장
	public void insertMycar(MyCarDto dto) {
		daoIn.save(dto);
	}
	
	//전체 출력
	public List<MyCarDto> getAllCars(){
		//return daoIn.findAll();
		return daoIn.findAll(Sort.by(Sort.Direction.DESC,"carprice"));
	}
	
	public MyCarDto getData(Long num) {
		return daoIn.getReferenceById(num);
	}
	
	public void deleteMycar(Long num) {
		daoIn.deleteById(num);
	}
	
	public void updateMycar(MyCarDto dto) {
		daoIn.save(dto); //num이 포함되어있으므로 수정
	}
	
	public void updateMycarNoPhoto(MyCarDto dto) {
		Long num = dto.getNum();
		String carname = dto.getCarname();
		String carcolor = dto.getCarcolor();
		int carprice = dto.getCarprice();
		
		daoIn.updateMycarNoPhoto(num, carname, carcolor, carprice);
		
	}
}
