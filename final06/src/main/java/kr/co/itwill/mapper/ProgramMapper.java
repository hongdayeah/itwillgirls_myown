package kr.co.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.itwill.program.ProgramDTO;

@Mapper
public interface ProgramMapper {
	//메인 화면에서 최신순(최신등록순? prorec_start)
	//			,조회순(조회수: pro_readcnt)
	//			, 관심순(좋아요: like_program에서 pro_obj 칼럼을 group by해서 개수 count 해야함), 

	// 조회순(조회 많이한 순서부터 내림차순 정렬) 프로그램 정보
	public List<ProgramDTO> clickSelect();
	
}// interface end
