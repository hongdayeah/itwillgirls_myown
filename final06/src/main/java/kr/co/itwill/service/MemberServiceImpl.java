package kr.co.itwill.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itwill.mapper.MemberMapper;
import kr.co.itwill.member.MemberDAO;
import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.member.kid.MemberKidDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Autowired
	MemberMapper membermapper;

	@Autowired
	SqlSession sqlSession;

	// ★ 부모 ★
	// 회원가입
	@Override
	public void memberJoin(MemberDTO dto) throws Exception {
		membermapper.memberJoin(dto);
	}// memberJoin() end

	// 아이디 중복확인
	@Override
	public int idCheck(String p_id) throws Exception {
		return membermapper.idCheck(p_id);
	}// idCheck() end

	// 로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return membermapper.login(dto);
	}// login() end

	// 회원탈퇴
	@Override
	public void memberDelete(MemberDTO dto) throws Exception {
		membermapper.memberDelete(dto);
	}// memberDelete() end

	// 회원정보수정
	@Override
	public void memberUpdate(MemberDTO dto) throws Exception {
		membermapper.memberUpdate(dto);
	}// memberUpdate() end

	// 아이디 찾기
	@Override
	public MemberDTO memberFindID(MemberDTO dto) throws Exception {
		return membermapper.memberFindID(dto);
	}// memberFindID() end

	// 비밀번호 찾기.v1
	/*
	 * @Override public void memberFindPW(HttpServletResponse response, MemberDTO
	 * dto) throws Exception { response.setContentType("text/html;charset=utf-8");
	 * MemberDTO ck = membermapper.readMember(dto.getP_id()); PrintWriter out =
	 * response.getWriter();
	 * 
	 * //System.out.println(ck); //MemberDTO [p_id=null, p_passwd=null, p_name=null,
	 * p_birth=null, p_gender=0, p_tell=null, p_email=mnonz@naver.com, p_addr1=null,
	 * p_addr2=null, p_grade=null, p_date=null] //System.out.println(dto.getP_id());
	 * //내가 입력한 ID값 //System.out.println(dto.getP_email()); //내가 입력한 이메일값
	 * //System.out.println(ck.getP_id()); //null
	 * //System.out.println(ck.getP_email()); //서버에 있는 이메일값
	 * 
	 * // 가입된 아이디가 없으면(중복된 아이디 체크, 중복일 경우: 1, 중복 아닐 경우: 0) if
	 * (membermapper.idCheck(dto.getP_id()) == 0) { out.print("등록되지 않은 아이디입니다.");
	 * out.close(); // 가입된 이메일이 없으면 } else if
	 * (!dto.getP_email().equals(ck.getP_email())) { out.print("등록되지 않은 이메일입니다.");
	 * out.close(); } else { // 임시 비밀번호 생성 String pw = ""; for (int i = 0; i < 12;
	 * i++) { pw += (char) ((Math.random() * 26) + 97); } // for end
	 * 
	 * dto.setP_passwd(pw); // 비밀번호 변경 membermapper.updatePW(dto); } // if end }//
	 * memberFindPW() end
	 */

	// 임시 비밀번호로 업데이트(수정 중)
	@Override
	public void updatePW(MemberDTO dto) throws Exception {
	}// updatePW() end

	// 비밀번호 찾기
	/*
	@Override
	public MemberDTO memberFindPW(MemberDTO dto) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;

		System.out.println("login 확인 : " + dto);

		// 회원정보 불러오기
		MemberDTO user = membermapper.login(dto);

		// 가입된 이메일이 존재한다면 이메일 발송
		if (user != null) {

			// 임시 비밀번호 생성(UUID 이용 - 특수문자는 넣을 수 없음)
			String tempPW = UUID.randomUUID().toString().replace("-", ""); // '-' 제거
			tempPW = tempPW.substring(0, 10); // 앞에서부터 10자리까지 자르기

			System.out.println("임시 비밀번호 확인 : " + tempPW);

			// dto 객체에 임시 비밀번호 담기
			dto.setP_passwd(tempPW);

			// 메일 전송
			MailUtil mail = new MailUtil();
			mail.sendMail(dto);

			// 회원 비밀번호를 암호화하여 dto객체에 다시 저장
			String securityPW = encoder.encode(dto.getP_passwd());
			user.setP_passwd(securityPW);

			// 비밀번호 변경
			membermapper.updatePW(dto);

			result = "Success";

		} else {
			result = "Fail";
		} // if end
		
		return dto;
	}// memberFindPW() end
	*/

	// 회원 정보 보기
	@Override
	public MemberDTO readMember(String p_id) throws Exception {

		System.out.println("S : readMember()실행");
		MemberDTO dto = null;

		try {
			dto = membermapper.readMember(p_id);
		} catch (Exception e) {
			e.printStackTrace();
		} // end

		return dto;
	}// readMember() end
	
	////////////////////////////////////////////////////////////////////////////////////////////
		
	// ★ 자녀 ★
	// 자녀 회원 등록
	@Override
	public void addKid(MemberKidDTO kid_dto) throws Exception {
		membermapper.addKid(kid_dto);
	}// addKid() end
	
	// 자녀 회원 목록
	@Override
	public List<MemberKidDTO> kidList() throws Exception {
		return membermapper.kidList();
	}// kidList() end
	

}// class end
