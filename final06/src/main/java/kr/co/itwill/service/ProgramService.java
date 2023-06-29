package kr.co.itwill.service;

import java.util.List;

import kr.co.itwill.program.ProgramDTO;

public interface ProgramService {
	
	// 조회순(조회 많이한 순서부터 내림차순 정렬) 프로그램 정보
	public List<ProgramDTO> clickSelect();
	
	// 최신 등록순(관리자가 최신에 올린 프로그램부터 보여주기, 등록일이 같을 경우 접수일이 빠른 순으로 보여주기) 프로그램 정보
	public List<ProgramDTO> currentSelect();
	
}// interface() end
