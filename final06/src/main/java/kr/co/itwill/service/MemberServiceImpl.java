package kr.co.itwill.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itwill.mapper.MemberMapper;
import kr.co.itwill.member.MemberDAO;
import kr.co.itwill.member.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Autowired
	MemberMapper membermapper;

	@Autowired
	SqlSession sqlSession;

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

	// 비밀번호 찾기(이메일 발송)
	@Override
	public void sendEmail(MemberDTO dto, String div) throws Exception {
		// mail server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.google.com"; // 구글 이용 시 "smtp.gmail.com" (보안 문제 때문에 gmail은 안 됨)
		String hostSMTPid = "qkffpsxkdl29@gmail.com"; // 서버 이메일 주소(보내는 사람 이메일 주소)
		String hostSMTPpw = "ienifcsbgkbjyxfp";

		// 보내는 사람 email, 제목, 내용
		String fromEmail = "webmaster@itwill.com"; // 보내는 사람 이메일 주소(받는 사람 이메일에 표시됨)
		String fromName = "웹마스터"; // 프로젝트 이름 또는 사람 이름
		String subject = "";
		String msg = "";

		if (div.equals("memberFindPW")) {
			subject = "아이티윌 어린이 체험관 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += dto.getP_id() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += dto.getP_passwd() + "</p></div>"; // 이렇게 보내면 임시비밀번호가 아닌 진짜 비밀번호가 아닌가?!
		}

		// 받는 사람 email 주소
		String mail = dto.getP_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 구글 이용시 465, 네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpw);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		} // end
	}// sendEmail() end

	// 비밀번호 찾기
	@Override
	public void memberFindPW(HttpServletResponse response, MemberDTO dto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberDTO ck = membermapper.readMember(dto.getP_id());
		PrintWriter out = response.getWriter();

		//System.out.println(ck); 				//MemberDTO [p_id=null, p_passwd=null, p_name=null, p_birth=null, p_gender=0, p_tell=null, p_email=mnonz@naver.com, p_addr1=null, p_addr2=null, p_grade=null, p_date=null]
		//System.out.println(dto.getP_id()); 		//내가 입력한 ID값
		//System.out.println(dto.getP_email()); 	//내가 입력한 이메일값
		//System.out.println(ck.getP_id()); 		//null
		//System.out.println(ck.getP_email()); 	//서버에 있는 이메일값
		
		// 가입된 아이디가 없으면(중복된 아이디 체크, 중복일 경우: 1, 중복 아닐 경우: 0)
		if (membermapper.idCheck(dto.getP_id()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
			// 가입된 이메일이 없으면
		} else if (!dto.getP_email().equals(ck.getP_email())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			} // for end

			dto.setP_passwd(pw);
			// 비밀번호 변경
			membermapper.updatePW(dto);
			// 비밀번호 변경 메일 발송
			sendEmail(dto, "memberFindPW");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		} // if end
	}// memberFindPW() end

	// 회원 정보 보기
	@Override
	public MemberDTO readMember(String p_id) throws Exception {
		
		System.out.println("S : readMember()실행");
		MemberDTO dto = null;
		
		try {
			dto = membermapper.readMember(p_id);
		} catch (Exception e) {
			e.printStackTrace();
		}//end
		
		return dto;
	}// readMember() end

}// class end
