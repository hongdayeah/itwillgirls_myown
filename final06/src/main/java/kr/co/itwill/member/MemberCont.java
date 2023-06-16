package kr.co.itwill.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itwill.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberCont {

	public MemberCont() {
		System.out.println("-----MemberCont() 객체 생성됨");
	}// end

	@Autowired
	private MemberService memberservice;

	/*
	 * //로그인 페이지 이동
	 * 
	 * @RequestMapping("/login.do") public String login() { return
	 * "member/memberLoginForm"; }//login() end
	 */

	// 로그인 페이지 이동
	@RequestMapping(value = "/memberLoginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String login() {
		return "/member/memberLoginForm";
	}// login() end

	// 회원가입 첫 페이지(약관동의) 이동
	@RequestMapping("/agree.do")
	public String agree() {
		return "member/agree";
	}

	// 회원가입 페이지 이동
	@RequestMapping("/join.do")
	public String join() {
		return "member/memberJoinForm";
	}// login() end

	/*
	 * //회원가입 요청
	 * 
	 * @RequestMapping("/joinProc") public String joinProc() { return
	 * "member/joinProc"; }//login() end
	 */

	// 회원가입
	@RequestMapping(value = "/memberJoinForm", method = RequestMethod.POST)
	public String joinPOST(MemberDTO dto) throws Exception {

		// 회원가입 서비스 실행
		memberservice.memberJoin(dto);

		return "redirect:/home.do";
	}// joinPOST() end

	/*
	 * @RequestMapping(value="/memberJoinForm", method=RequestMethod.POST) public
	 * String joinPOST(Map<String, Object> map, @RequestParam(required = false)
	 * String p_addr1, @RequestParam(required = false) String p_addr2) throws
	 * Exception{
	 * 
	 * map.put("p_addr1", p_addr1); map.put("p_addr2", p_addr2); // 회원가입 서비스 실행
	 * memberservice.memberJoin(map);
	 * 
	 * return "redirect:/home.do"; }//joinPOST() end
	 */

	// 아이디 중복 확인
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String p_id) throws Exception {
		int result = memberservice.idCheck(p_id);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		} // if end
	}// memberIdChkPOST() end

	// 로그인
	@RequestMapping("/memberLoginForm")
	@ResponseBody
	public String login(HttpServletRequest request, MemberDTO dto, RedirectAttributes rttr) throws Exception {

		// 세션 변수 초기화
		HttpSession session = request.getSession();
		
		String result = "";
		dto = memberservice.login(dto);
		
		//일치하는 아이디, 비번 불일치
		if(dto == null) {
			result = "fail";
		} else {
			if(dto.getP_grade() == null) {
				System.out.println("탈퇴회원인지 확인 -> 상태" + dto.getP_grade());
				//탈퇴회원
				result = "withdraw";
			} else if(dto.getP_grade() == "P") {
				//아이디, 비밀번호 일치 시 세션에 로그인 정보 담기
				//session.setAttribute(result, dto); -> 조금 더 고민해보자
				result = "success";
			}//if end
		}//if end
		System.out.println("result -> " + result);
		
		return result;
	}// login() end

}// class end
