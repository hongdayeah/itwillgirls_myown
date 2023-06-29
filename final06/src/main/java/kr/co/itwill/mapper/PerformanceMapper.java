package kr.co.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.itwill.performance.PerformanceDTO;

@Mapper
public interface PerformanceMapper {

	// 가까운 날짜순 공연 정보
	public List<PerformanceDTO> approachSelect();
	
}// interface end
