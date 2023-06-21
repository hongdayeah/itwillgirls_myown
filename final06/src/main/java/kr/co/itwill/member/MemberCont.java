package kr.co.itwill.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	// 아이디 저장 (loginProc()에 이용)
	public boolean rememberId(boolean rememberId) {
		return rememberId;
	}// rememberId() end

	// 로그인 작동
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginProc(HttpServletRequest req, MemberDTO member_dto, RedirectAttributes rttr, boolean rememberId,
			HttpServletResponse response) throws Exception {
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
		} // if end

		// 아이디 저장하기
		if (rememberId(rememberId)) { // 아이디 저장을 체크했다면
			Cookie cookie = new Cookie("id", dto2.getP_id()); // 쿠키 변수에 세션 아이디 저장
			cookie.setMaxAge(60 * 60 * 24 * 30); // 1달 저장
			response.addCookie(cookie);
			System.out.println(cookie); // 쿠키 저장 됐니?
		} else {
			Cookie cookie = new Cookie("id", dto2.getP_id());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			System.out.println(cookie); // 쿠키 저장 안 됐니?
		} // if end

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

		// System.out.println(s_passwd);
		// System.out.println(dto_passwd);

		if (!s_passwd.equals(dto_passwd)) { // 비밀번호가 일치하지 않을 때
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberWithdraw.do";
		} // if end

		memberservice.memberDelete(dto);
		session.invalidate();
		return "redirect:/home.do";
	}// memberDelete() end

	// 회원정보 수정 페이지 이동
	@RequestMapping(value = "/memberModify.do", method = RequestMethod.GET)
	public String modify() {
		return "member/memberModifyForm";
	}// modify() end

	// 회원정보 수정
	@RequestMapping(value = "/memberModify.do", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberDTO dto) throws Exception {
		memberservice.memberUpdate(dto);
		return "redirect:/home.do"; // 추후 경로 수정할 예정입니다~
	}// memberUpdate() end

	// 아이디 찾기 페이지 이동
	@RequestMapping(value = "/findID.do", method = RequestMethod.GET)
	public String findID() {
		return "member/findID";
	}// searchID() end

	// 아이디 찾기
	@RequestMapping(value = "/findID.do", method = RequestMethod.POST)
	public String memberFindID(Model model
								, @RequestParam(required = true, value = "p_name") String p_name
								, @RequestParam(required = true, value = "p_tell") String p_tell
								, MemberDTO dto) {
		
		try {
			dto.setP_name(p_name);
			dto.setP_tell(p_tell);
			MemberDTO memberSearch = memberservice.memberFindID(dto);
			
			model.addAttribute("dto", memberSearch);
		} catch (Exception e) {
			System.out.println("아이디 찾기 실패");
			model.addAttribute("msg", "오류가 발생되었습니다.");
		}//try~catch end
		
		return "member/findIDProc";
	}// searchID() end

}// class end
