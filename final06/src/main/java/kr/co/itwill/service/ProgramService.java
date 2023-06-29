package kr.co.itwill.service;

import java.util.List;

import kr.co.itwill.program.ProgramDTO;

public interface ProgramService {
	
	//String NAMESPACE = "program";

	// 조회순(조회 많이한 순서부터 내림차순 정렬) 프로그램 정보
	public List<ProgramDTO> clickSelect();
	
}// interface() end
