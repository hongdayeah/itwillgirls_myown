package kr.co.itwill.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberCont {

	public MemberCont() {
		System.out.println("-----MemberCont() 객체 생성됨");
	}//end
	
	@Autowired
	MemberDAO memberDao;
	
	@RequestMapping(value = "/MemberJoinForm", method = RequestMethod.GET)
	public String memberForm() {
		return "/member/MemberJoinForm";
	}//memberForm() end
	
	@RequestMapping("/insert")
	public ModelAndView memberInsert() {
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}//memberInsert() end
	
}//class end
