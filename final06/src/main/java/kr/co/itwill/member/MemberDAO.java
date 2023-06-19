package kr.co.itwill.member;

import javax.servlet.http.HttpSession;

public interface MemberDAO {
	
	String NAMESPACE = "member";

	//회원가입
	public void memberJoin(MemberDTO dto);

	//아이디 중복확인
	public int idCheck(String p_id);


}// interface end
