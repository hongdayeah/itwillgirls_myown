package kr.co.itwill.member;

public interface MemberDAO {

	String NAMESPACE = "member";

	// 회원가입
	public void memberJoin(MemberDTO dto);

	// 아이디 중복확인
	public int idCheck(String p_id);

	// 패스워드 체크
	public boolean pwCheck(String p_id, String p_passwd) throws Exception;

	// 회원탈퇴
	public void withdrawProc(String p_id) throws Exception;

}// interface end
