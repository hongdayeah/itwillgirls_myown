package kr.co.itwill.member;

import javax.servlet.http.HttpSession;

public interface MemberDAO {

	//회원가입
	public void memberJoin(MemberDTO dto);

	//아이디 중복확인
	public int idCheck(String p_id);

	//로그인 체크
	public boolean loginCheck(MemberDTO dto);

	//로그인 정보
	public MemberDTO viewMember(MemberDTO dto);

	//로그아웃
	public void logout(HttpSession session);

}// interface end
