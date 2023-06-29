package kr.co.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itwill.mapper.ProgramMapper;
import kr.co.itwill.program.ProgramDTO;

@Service
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	ProgramMapper programmapper;

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

	// 최신 등록순(관리자가 최신에 올린 프로그램부터 보여주기, 등록일이 같을 경우 접수일이 빠른 순으로 보여주기) 프로그램 정보
	@Override
	public List<ProgramDTO> currentSelect() {
		List<ProgramDTO> list = programmapper.currentSelect();

		list.forEach(dto -> {
			String pro_obj = dto.getPro_obj();
			String pro_poster = dto.getPro_poster();

			dto.setPro_poster(pro_poster);
		});

		return list;
	}// currentSelect() end	

}// class end
