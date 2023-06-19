package kr.co.itwill.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	}// join() end

	// 회원가입
	@RequestMapping(value = "/memberJoinForm", method = RequestMethod.POST)
	public String joinPOST(MemberDTO dto) throws Exception {

		// 회원가입 서비스 실행
		memberservice.memberJoin(dto);

		return "redirect:/home.do";
	}// joinPOST() end

	// 아이디 중복 확인
	@RequestMapping(value = "/memberIdChk.do", method = RequestMethod.POST)
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
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginProc(HttpServletRequest req, MemberDTO member_dto, RedirectAttributes rttr) throws Exception {
		// System.out.println("login 메서드 진입");
		// System.out.println("전달된 데이터 : " + dto);

		// 변수 선언 및 초기화
		HttpSession session = req.getSession();
		MemberDTO dto2 = memberservice.login(member_dto); // header에서 다른 카테고리 dto와 혼선이 생겨 이번 메소드에서만 구분함

		if (dto2 == null) { // 로그인 실패
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login.do";
		} // if end

		session.setAttribute("member_dto", dto2); // 로그인 성공

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

	// 회원 탈퇴 페이지 이동
	@RequestMapping("/memberWithdraw.do")
	public String withdraw() {
		return "member/withDrawPwCheck";
	}// withdraw() end

	// 패스워드 체크 (수정 중)
	/*
	@RequestMapping(value = "/pwCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheck(MemberDTO member_dto) throws Exception {

		int result = memberservice.pwCheck(member_dto);

		if (result != 0) {
			return "success"; // 비밀번호 일치 O
		} else {
			return "fail"; // 비밀번호 일치 X
		} // if end
	}// pwCheck() end
	*/
	/*	
	// 회원탈퇴(수정 중)
	@RequestMapping("/withdrawProc.do")
	public String withdrawProc(MemberDTO dto, HttpSession session, HttpServletRequest req) throws Exception {
		memberservice.withdrawProc(dto, session, req);

		// 세션 변수 초기화
		session = req.getSession();
		session.invalidate();

		return "redirect:/home.do";
	}// withdrawProc() end
	*/
	
	// 회원탈퇴(수정 중)
	@RequestMapping("/withdrawProc.do")
	public String withdrawProc(@RequestParam String p_id, @RequestParam String p_passwd, Model model, HttpServletRequest req) throws Exception {
		//비밀번호 체크
		boolean result = memberservice.pwCheck(p_id, p_passwd);
		if(result) { //비밀번호가 일치하면 탈퇴 후 메인화면으로 이동
			memberservice.withdrawProc(p_id);
			
			// 세션 변수 초기화
			HttpSession session = req.getSession();
			session.invalidate();
			
			return "redirect:/home.do";
			
		} else {	//비밀번호가 일치하지 않으면 다시 비밀번호 입력하기
			model.addAttribute("msg", "비밀번호 불일치");
			return "member/withDrawPwCheck";
		}//if end
	}// withdrawProc() end
	
}// class end
