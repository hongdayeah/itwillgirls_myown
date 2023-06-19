package kr.co.itwill.service;

import kr.co.itwill.member.MemberDTO;

public interface MemberService {

	// 회원가입
	public void memberJoin(MemberDTO dto) throws Exception;

	// 아이디 중복확인
	public int idCheck(String p_id) throws Exception;

	// 로그인
	public MemberDTO login(MemberDTO dto) throws Exception;

	// 패스워드 체크
	public boolean pwCheck(String p_id, String p_passwd) throws Exception;

	// 회원탈퇴
	public void withdrawProc(String p_id) throws Exception;

}// interface end
