package kr.co.itwill.testresult;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestresultCont {
	
	@Autowired
	private TestresultDAO dao;
	
	public TestresultCont() {
		System.out.println("-----TestresultCont()객체 생성됨");
	}
	
	//테스트 시작 화면이자 자녀의 이름을 입력받는 화면
	@RequestMapping(value="/test/main.do", method=RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("test/main");
		
		return mav;
	}//main() end
	
	@RequestMapping(value="/test/create.do", method=RequestMethod.POST)
	public String createProc(@RequestParam("k_name") String k_name, HttpSession session) {
		
		//세션값의 p_id 가져오기
		//안가져와져ㅠ 
		String p_id = (String)session.getAttribute("p_id");
		
		//p_id와 k_name값 입력
		int cnt = dao.create(p_id, k_name);
		
		
		if(cnt==0) {
			System.out.println("testreuslt 행 삽입 실패");
		}
		
		//자녀이름은 한글인데 디비에는 잘 들어가진다.
		//근데 url엔 한글이라서 ???로 깨지길래 utf-8로 url을 인코딩해주었다.
		String enk_name = URLEncoder.encode(k_name, StandardCharsets.UTF_8);
		String redirectUrl = "redirect:/test/sungtest.do?k_name=" + enk_name;
		
		return redirectUrl;
	}//createProc() end
}//class end
