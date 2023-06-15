package kr.co.itwill.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itwill.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberCont {

	public MemberCont() {
		System.out.println("-----MemberCont() 객체 생성됨");
	}//end
	
	@Autowired
	private MemberService memberservice;
	  
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
	
	/*
	//회원가입 요청
	@RequestMapping("/joinProc")
	public String joinProc() {
		return "member/joinProc";
	}//login() end
	*/
	
	//회원가입
	@RequestMapping(value="/memberJoinForm", method=RequestMethod.POST)
	public String joinPOST(MemberDTO dto) throws Exception{

		// 회원가입 서비스 실행
		memberservice.memberJoin(dto);

		return "redirect:/home.do";
	}//joinPOST() end
	
	/*
	@RequestMapping(value="/memberJoinForm", method=RequestMethod.POST)
	public String joinPOST(Map<String, Object> map, @RequestParam(required = false) String p_addr1, @RequestParam(required = false) String p_addr2) throws Exception{

		map.put("p_addr1", p_addr1);
		map.put("p_addr2", p_addr2);
		// 회원가입 서비스 실행
		memberservice.memberJoin(map);

		return "redirect:/home.do";
	}//joinPOST() end
	*/
	
	//아이디 중복 확인
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String p_id)  throws Exception {
	int result = memberservice.idCheck(p_id);
	
			if(result != 0) {			
				return "fail";	// 중복 아이디가 존재
			} else {
				return "success";	// 중복 아이디 x
			}//if end
	}//memberIdChkPOST() end
}//class end
