package kr.co.itwill.member;

public interface MemberDAO {

	String NAMESPACE = "member";

	// 회원가입
	public void memberJoin(MemberDTO dto);

	// 아이디 중복확인
	public int idCheck(String p_id);

	//회원 탈퇴
	public void memberDelete(MemberDTO dto) throws Exception;

}// interface end
