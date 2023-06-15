package kr.co.itwill.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.itwill.member.MemberDTO;

@Mapper
public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberDTO dto);
	
	/*
	public void memberJoin(Map<String, Object> map);
	*/
}//interface end
