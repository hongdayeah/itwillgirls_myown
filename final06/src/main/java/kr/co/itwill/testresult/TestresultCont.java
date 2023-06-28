package kr.co.itwill.testresult;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.member.kid.MemberKidDTO;

@Controller
public class TestresultCont {
	
	@Autowired
	private TestresultDAO dao;
	
	public TestresultCont() {
		System.out.println("-----TestresultCont()객체 생성됨");
	}
	
	//테스트 시작 화면이자 자녀의 이름을 입력받는 화면
	@RequestMapping(value="/test/main.do", method=RequestMethod.GET)
	public ModelAndView main(@RequestParam(value = "p_id", required = false) String p_id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("test/main");
		
		//로그인 한 p_id 가져오기
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		
		//p_id가 null값(로그아웃)이어도 페이지 볼 수 있게 하기
		if(memdto != null) {
			p_id = memdto.getP_id();
		}else {
			p_id = "guest";
		}
		//System.out.println(p_id);
		
		//해당 아이디의 자녀 리스트 보여주기
		//TestresultDAO에 선언한 klist()함수 추가 (p_id=?인 행에 대해서만 조회)
		List<MemberKidDTO> klist = dao.klist(p_id);
		mav.addObject("klist", klist);
		//System.out.println(klist);
		return mav;
	}//main() end
	
	@RequestMapping(value="/test/create.do", method=RequestMethod.POST)
	public String createProc(@RequestParam("k_no") int k_no, @RequestParam(value = "p_id", required = false) String p_id, HttpSession session, Model model) {
		
		//로그인 한 p_id 가져오기
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		
		//p_id가 null값(로그아웃)이어도 페이지 볼 수 있게 하기
		if(memdto != null) {
			p_id = memdto.getP_id();
		}else {
			p_id = "guest";
		}
		//System.out.println(p_id);
		
		//TestresultDAO에 선언한 kread()함수 추가 (k_no=?인 행의 자녀이름 조회)
		String k_name = dao.kread(k_no);
		
		//p_id와 k_name값 입력
		int cnt = dao.create(p_id, k_name, k_no);
		
		//k_no값 뷰단으로 넘기기
		model.addAttribute("k_no", k_no);
		//System.out.println(k_no);
		
		if(cnt==0) {
			System.out.println("testreuslt 행 삽입 실패");
		}
		
		//자녀이름은 한글인데 디비에는 잘 들어가진다.
		//근데 url엔 한글이라서 ???로 깨지길래 utf-8로 url을 인코딩해주었다.
		//String enk_name = URLEncoder.encode(k_name, StandardCharsets.UTF_8);
		//String redirectUrl = "redirect:/test/sungtest.do?k_name=" + k_name;
		
		return "redirect:/test/sungtest.do?k_no="+k_no;
	}//createProc() end
}//class end
