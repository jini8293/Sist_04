package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MarKetDto;

@Mapper
public interface MarKetMapperInter {
	
	public int getTotalCount();
	public void insertMarket(MarKetDto dto);
	public List<MarKetDto> getAllDatas();
	public MarKetDto getData(String num);
	public void updateMarket(MarKetDto dto);
	public void deleteMatket(String num);

}
