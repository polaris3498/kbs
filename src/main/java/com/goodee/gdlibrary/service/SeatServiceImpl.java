package com.goodee.gdlibrary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.gdlibrary.domain.SeatDTO;
import com.goodee.gdlibrary.mapper.SeatMapper;

@Service
public class SeatServiceImpl implements SeatService {
	
	@Autowired
	private SeatMapper seatMapper;
	
	@Override
	public List<SeatDTO> findSeatList() {
		return seatMapper.selectSeatList();
	}
	
	@Override
	public Map<String, Object> findSeat(Long seatNo) {
		System.out.println(seatNo);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("imple에서 찍은 dto : " + seatMapper.selectSeatByNo(seatNo));
		map.put("seats", seatMapper.selectSeatByNo(seatNo));
		
		return map;
	}
	
	@Override
	public void upSeatUsingState(Long seatNo) {
		System.out.println("다음 : " + seatNo);
		seatMapper.updateUpSeatUsingState(seatNo);
	}
	
}
