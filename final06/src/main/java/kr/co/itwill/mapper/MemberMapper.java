package kr.co.itwill.mapper;

import org.apache.ibatis.annotations.Mapper;
import kr.co.itwill.member.MemberDTO;

@Mapper
public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberDTO dto);
	
	//아이디 중복확인
	public int idCheck(String p_id);
	
	//로그인
	public MemberDTO login(MemberDTO dto);
	
	//회원탈퇴
	public boolean pwCheck(String p_id, String p_passwd);
	
	//회원탈퇴
	public void withdrawProc(String p_id);
	
}//interface end
