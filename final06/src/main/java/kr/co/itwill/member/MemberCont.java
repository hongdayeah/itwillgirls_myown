package kr.co.itwill.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/member")
public class MemberCont {

	public MemberCont() {
		System.out.println("-----MemberCont() 객체 생성됨");
	}//end
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("/login.do")
	public String login() {
		return "member/memberLoginForm";
	}//login() end
	
	@RequestMapping("/join.do")
	public String insert() {
		return "member/memberJoinForm";
	}//insert() end
	
	@RequestMapping("/joinProc.do")
	public String joinProc() {
		return "member/joinProc";
	}//insert() end
	
	
	
}//class end
