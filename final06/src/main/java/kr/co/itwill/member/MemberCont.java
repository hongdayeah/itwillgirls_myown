package kr.co.itwill.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/member")
public class MemberCont {

	public MemberCont() {
		System.out.println("-----MemberCont() 객체 생성됨");
	}//end
	
	@Autowired
	private MemberDAO dao;
	
	//로그인 페이지 이동
	@RequestMapping("/login.do")
	public String login() {
		return "member/memberLoginForm";
	}//login() end
	
	//회원가입 페이지 이동
	@RequestMapping("/join.do")
	public String join() {
		return "member/memberJoinForm";
	}//login() end
	
	//회원가입 요청
	@RequestMapping("/joinProc")
	public String joinProc() {
		return "member/joinProc";
	}//login() end
	
	
	
	
}//class end
