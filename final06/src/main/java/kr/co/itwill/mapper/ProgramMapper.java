package kr.co.itwill.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.itwill.program.ProgramDTO;

@Mapper
public interface ProgramMapper {
	//메인 화면에서 최신순(최신등록순? prorec_start)
	//			,조회순(조회수: pro_readcnt)
	//			, 관심순(좋아요: like_program에서 pro_obj 칼럼을 group by해서 개수 count 해야함), 

	// 조회순(조회 많이한 순서부터 내림차순 정렬) 프로그램 정보
	public List<ProgramDTO> clickSelect();
	
	// 최신 등록순(관리자가 최신에 올린 프로그램부터 보여주기, 등록일이 같을 경우 접수일이 빠른 순으로 보여주기) 프로그램 정보
	public List<ProgramDTO> currentSelect();
	
	// 관심순(좋아요 많은 순부터 내림차순 정렬, 좋아요 수가 같을 경우 프로그램 이름 오름차순 정렬) 프로그램 정보
	public List<Map<String, Object>> likeSelect();
	
}// interface end
