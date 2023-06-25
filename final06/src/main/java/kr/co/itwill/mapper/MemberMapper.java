package kr.co.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.member.kid.MemberKidDTO;

@Mapper
public interface MemberMapper {

	// ★ 부모 ★
	// 회원가입
	public void memberJoin(MemberDTO dto);

	// 아이디 중복확인
	public int idCheck(String p_id);

	// 로그인
	public MemberDTO login(MemberDTO dto);

	// 회원 탈퇴
	public void memberDelete(MemberDTO dto) throws Exception;

	// 회원정보 수정
	public void memberUpdate(MemberDTO dto) throws Exception;

	// 아이디 찾기
	public MemberDTO memberFindID(MemberDTO dto) throws Exception;

	// 비밀번호 변경(임시비밀번호로 업데이트)
	public void updatePW(MemberDTO dto) throws Exception;

	// 회원 정보 보기
	public MemberDTO readMember(String p_id) throws Exception;

	// 아이디 찾기
	public MemberDTO memberFindPW(MemberDTO dto) throws Exception;

	////////////////////////////////////////////////////////////////////////////////////////////
	
	// ★ 자녀 ★
	// 자녀 회원 등록
	public void addKid(MemberKidDTO kid_dto) throws Exception;
	
	// 자녀 회원 목록
	public List<MemberKidDTO> kidList() throws Exception;
	
}// interface end
