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
			session.setAttribute("member_dto", null); // 로그인 실패 시 session 변수에 null값 저장
			
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login.do";
		} else {
			session.setAttribute("member_dto", dto2); // 로그인 성공
		}// if end

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

	// 회원탈퇴
	@RequestMapping(value = "/memberDelete.do", method = RequestMethod.POST)
	public String memberDelete(MemberDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {

		// 세션에 있는 값을 가져와서 변수에 넣기
		MemberDTO member_dto = (MemberDTO) session.getAttribute("member_dto");

		// 세션에 있는 비밀번호 가져오기
		String s_passwd = member_dto.getP_passwd();

		// 새롭게 입력될 비밀번호 가져오기
		String dto_passwd = dto.getP_passwd();
		
		//System.out.println(s_passwd);
		//System.out.println(dto_passwd);

		if (!s_passwd.equals(dto_passwd)) { //비밀번호가 일치하지 않을 때
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberWithdraw.do";
		} // if end
		
		memberservice.memberDelete(dto);
		session.invalidate();
		return "redirect:/home.do";
	}// memberDelete() end

}// class end
