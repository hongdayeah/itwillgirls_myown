package kr.co.itwill.service;

import kr.co.itwill.member.MemberDTO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberDTO dto) throws Exception;
	
	/*
	public void memberJoin(Map<String, Object> map) throws Exception;
	*/
	
	//아이디 중복확인
	public int idCheck(String p_id) throws Exception;
	
	//로그인
    public MemberDTO login(MemberDTO dto) throws Exception;
    
}//interface end
