package kr.co.itwill.member;

public interface MemberDAO {

	String NAMESPACE = "member";

	// 회원가입
	public void memberJoin(MemberDTO dto);

	// 아이디 중복확인
	public int idCheck(String p_id);

	// 회원 탈퇴
	public void memberDelete(MemberDTO dto) throws Exception;

	// 회원정보 수정
	public void memberUpdate(MemberDTO dto) throws Exception;

	// 비밀번호 변경(임시비밀번호로 업데이트)
	public int updatePW(MemberDTO dto) throws Exception;

	// 회원 정보 보기
	public MemberDTO readMember(String p_id) throws Exception;

	// 비밀번호 찾기
	public MemberDTO memberFindPW(String p_id) throws Exception;

}// interface end
