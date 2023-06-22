package kr.co.itwill.member.kid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member_kid")
public class MemberKidCont {

	public MemberKidCont() {
		System.out.println("-----MemberKidCont() 객체 생성됨");
	}//end
	
	@RequestMapping("/addKid.do")
	public String addKid() {
		return "member_kid/kidAddForm";
	}// addKid() end
	
}//class end
