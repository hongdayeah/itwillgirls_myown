package kr.co.itwill.member;

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
	
	@RequestMapping("/login")
	public String login() {
		return "member/memberLoginForm";
	}//login() end
	
	@RequestMapping("/join")
	public String insert() {
		return "member/memberJoinForm";
	}//insert() end
	
	
	
}//class end
