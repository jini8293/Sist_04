package info.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao {
	
	@Autowired
	InfoDaoInter daoIn;
	
	public void insertInfo(InfoDto dto) {
		daoIn.save(dto);
	}
	
	public List<InfoDto> getAllDatas(){
		return daoIn.findAll();
	}

	public InfoDto getData(Integer num) {
		return daoIn.getReferenceById(num);
	}
	
	public void updateInfo(InfoDto dto) {
		daoIn.save(dto);
	}
	
	public void deleteInfo(Integer num) {
		daoIn.deleteById(num);
	}
}
