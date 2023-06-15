package kr.co.itwill.service;

import java.util.Map;

import kr.co.itwill.member.MemberDTO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberDTO dto) throws Exception;
	
	/*
	public void memberJoin(Map<String, Object> map) throws Exception;
	*/
}//interface end
