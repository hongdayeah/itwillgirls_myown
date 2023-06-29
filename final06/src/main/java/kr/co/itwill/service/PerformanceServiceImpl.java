package kr.co.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itwill.mapper.PerformanceMapper;
import kr.co.itwill.performance.PerformanceDTO;

@Service
public class PerformanceServiceImpl implements PerformanceService {

	@Autowired
	PerformanceMapper performancemapper;

	// 가까운 날짜순 공연 정보
	@Override
	public List<PerformanceDTO> approachSelect() {
		List<PerformanceDTO> list = performancemapper.approachSelect();

		list.forEach(dto -> {
			String per_code = dto.getPer_code();
			String per_img = dto.getPer_img();

			dto.setPer_img(per_img);
		});
		System.out.println(list); // null
		return list;
	}// approachSelect() end

}//class end
