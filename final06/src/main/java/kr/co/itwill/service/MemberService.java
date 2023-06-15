package kr.co.itwill.service;

import kr.co.itwill.member.MemberDTO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberDTO dto) throws Exception;
	
}//interface end
