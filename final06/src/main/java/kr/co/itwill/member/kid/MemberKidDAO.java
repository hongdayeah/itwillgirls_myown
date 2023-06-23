package kr.co.itwill.member.kid;

import java.util.List;

public interface MemberKidDAO {

	String NAMESPACE = "member";
	
	// 자녀 회원 등록
	public void addKid(MemberKidDTO kid_dto) throws Exception;
	
	// 자녀 회원 목록
	public List<MemberKidDTO> kidList() throws Exception;
	
}//interface() end
