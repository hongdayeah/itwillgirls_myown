package kr.co.itwill;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.service.KakaoAPI;

@Controller
public class HomeController {

	public HomeController() {
		System.out.println("-----HomeController() 객체 생성됨");
	}// end

	// 프로젝트의 첫페이지 호출 명령어 등록
	// http://localhost:9095/home.do

	@RequestMapping("/home.do")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		// redirect: 등록한 명령어를 호출할 수 있다
		mav.setViewName("home");

		return mav;
	}// home() end

	// 아래부터는 카카오 로그인 관련 내용입니다
	@Autowired
	private KakaoAPI kakao;

	@RequestMapping(value = "/")
	public String index() {

		return "index";
	}// index() end

	@RequestMapping(value = "/member/kakao")
	public String login(@RequestParam("code") String code, HttpSession session) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}
		// return "/member/index";
		return "redirect:/home.do";
	}// login() end

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "redirect:/home.do";
	}// logout() end

	@RequestMapping("/agree_1")
	public String agree_footer1() {
		return "/member/agree_footer1";
	}// agree_footer1() end

	@RequestMapping("/agree_2")
	public String agree_footer2() {
		return "/member/agree_footer2";
	}// agree_footer1() end
	
}// class end