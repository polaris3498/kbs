package com.goodee.gdlibrary.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.gdlibrary.domain.SeatDTO;

@Mapper
public interface SeatMapper {
	
	public List<SeatDTO> selectSeatList();
	public SeatDTO selectSeatByNo(Long seatNo);
	public int updateUpSeatUsingState(Long seatNo);

}