package kr.co.itwill.service;

import java.util.List;

import kr.co.itwill.performance.PerformanceDTO;

public interface PerformanceService {

	// 가까운 날짜순 공연 정보
	public List<PerformanceDTO> approachSelect();
	
}//interface end
