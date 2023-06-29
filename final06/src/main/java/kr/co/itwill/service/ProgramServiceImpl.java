package kr.co.itwill.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itwill.mapper.ProgramMapper;
import kr.co.itwill.program.ProgramDTO;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	ProgramMapper programmapper;

	@Autowired
	SqlSession sqlSession;	
	
	// 조회순(조회 많이한 순서부터 내림차순 정렬) 프로그램 정보
	@Override
	public List<ProgramDTO> clickSelect() {
		List<ProgramDTO> list = programmapper.clickSelect();
		
		// 이 흐름 약간 어려움. 맨 밑의 dto.~ 코드가 의미가 있나? 일단 해보자~
		list.forEach(dto -> {
			String pro_obj = dto.getPro_obj();
			String pro_poster = dto.getPro_poster();
			
			dto.setPro_poster(pro_poster);
		});
		
		return list;
	}// likeSelect() end

}// class end
