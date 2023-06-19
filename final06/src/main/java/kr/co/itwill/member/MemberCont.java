package kr.co.itwill.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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
	 * @RequestMapping("/login.do") public String login2() { return
	 * "member/memberLoginForm"; }//login2() end
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
	}// agree() end

	// 회원가입 페이지 이동
	@RequestMapping("/join.do")
	public String join() {
		return "member/memberJoinForm";
	}// login() end

	// 회원가입
	@RequestMapping(value = "/memberJoinForm", method = RequestMethod.POST)
	public String joinPOST(MemberDTO dto) throws Exception {

		// 회원가입 서비스 실행
		memberservice.memberJoin(dto);

		return "redirect:/home.do";
	}// joinPOST() end

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

	// 로그인 페이지 이동
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}// loginForm() end

	// 로그인 작동
	/*
	 * @RequestMapping(value = "/login.do", method = RequestMethod.POST) public
	 * ModelAndView loginProc(@ModelAttribute MemberDTO dto, HttpServletRequest req,
	 * HttpServletResponse resp, HttpSession session) {
	 * 
	 * //String p_name = dto.getP_name(); String p_id = dto.getP_id(); String
	 * p_passwd = dto.getP_passwd();
	 * 
	 * ModelAndView mav = new ModelAndView(); if(p_id.equals(dto.getP_id()) &&
	 * p_passwd.equals(dto.getP_passwd())) { //로그인 성공 webmaster말고 dto에 있는 아이디,
	 * 패스워드로도 로그인 되는지 확인해보자~ mav.setViewName("/intro2"); //홈으로 이동
	 * //session.setAttribute("p_name", p_name); session.setAttribute("p_id", p_id);
	 * session.setAttribute("p_passwd", p_passwd); req.setAttribute("msg",
	 * "success"); } else { //로그인 실패 mav.setViewName("member/loginForm");
	 * req.setAttribute("msg", "failure"); }//if end
	 * 
	 * return mav; }//loginProc() end
	 */

	// 로그인 작동(v2)
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginProc(HttpServletRequest req, MemberDTO program_dto, RedirectAttributes rttr) throws Exception {
		// System.out.println("login 메서드 진입");
		// System.out.println("전달된 데이터 : " + dto);

		// 변수 선언 및 초기화
		HttpSession session = req.getSession();
		MemberDTO dto2 = memberservice.login(program_dto);

		if (dto2 == null) { // 로그인 실패
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login.do";
		} // if end

		session.setAttribute("program_dto", dto2); // 로그인 성공

		return "redirect:/home.do";
	}// loginProc() end

	// 로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) throws Exception {

		// 세션 변수 초기화
		HttpSession session = req.getSession();
		session.invalidate();

		return "redirect:/home.do";
	}// logout() end

	// 회원정보 수정
	@RequestMapping("/pwCheck.do")
	public String pwCheck() {
		return "member/pwCheck";
	}//pwCheck() end

}// class end
