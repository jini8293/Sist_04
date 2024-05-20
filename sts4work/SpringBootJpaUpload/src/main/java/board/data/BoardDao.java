package board.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	
	@Autowired 
	BoardDaoInter daoIn;
	
	public void insertBoard(BoardDto dto) {
		daoIn.save(dto);
	}
	
	public List<BoardDto> getAllData(){
		return daoIn.findAll(Sort.by(Sort.Direction.DESC,"num"));
	}
	
	public BoardDto getData(long num) {
		return daoIn.getReferenceById(num);
	}

}
