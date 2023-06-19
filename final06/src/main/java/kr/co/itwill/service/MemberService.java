package kr.co.itwill.service;

import javax.servlet.http.HttpServletRequest;

import kr.co.itwill.member.MemberDTO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberDTO dto) throws Exception;
	
	//아이디 중복확인
	public int idCheck(String p_id) throws Exception;
	
    
}//interface end
