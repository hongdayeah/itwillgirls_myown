package kr.co.itwill.member.kid;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.service.MemberService;

@Controller
@RequestMapping("/member_kid")
public class MemberKidCont {

	public MemberKidCont() {
		System.out.println("-----MemberKidCont() 객체 생성됨");
	}// end
	
	@Autowired
	MemberService memberservice; // 부모와 자녀 모두 MemberService에서 진행
	
	@Autowired
	private KidDAO dao;

	/* 작업 중 0624 12:54
	// 자녀 회원 등록 페이지 이동
	@RequestMapping("/addKid.do")
	public String addKid() {
		return "member_kid/kidAddForm";
	}// addKid() end
	
	
	// 자녀 회원 등록
	@RequestMapping(value = "/addKid.do", method = RequestMethod.POST)
	public String addKid(MemberKidDTO kid_dto) throws Exception {

		// 자녀 회원 등록 실행
		memberservice.addKid(kid_dto);
		
		return "redirect:/home.do";
		//return "member_kid/kidList";
	}// joinPOST() end
	
	
	// 자녀 회원 등록 페이지 이동
		@RequestMapping(value = "/kidList.do", method = RequestMethod.GET)
		public String kidList() {
			return "member_kid/kidList";
		}// addKid() end
		*/
	
	// 자녀 회원 목록 보여주기	
	//@RequestMapping(value = "/kidList.do", method = RequestMethod.POST)
	@RequestMapping("/kidList.do")	
	public ModelAndView kidList(HttpSession session) {
	//	public ModelAndView kidList(String p_id) {
		
		//로그인 성공 했을 때 로그인 정보는 세션에 올려진 상태
		Object obj=session.getAttribute("member_dto");
		MemberDTO mDto=(MemberDTO) obj;
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/kidList");
		mav.addObject("list", dao.list(mDto.getP_id()));
		//mav.addObject("p_id", p_id); // 부모아이디 넘기기 -> 세션값은 넘기지 않아도 됨
		return mav;
	}//list() end
	
	@RequestMapping(value = "/addKid.do", method = RequestMethod.GET)
	public ModelAndView createForm(String p_id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/kidAddForm");
		mav.addObject("p_id", p_id); //부모글번호
		return mav;
	}//createForm() end
	
	@RequestMapping(value = "/addKid.do", method = RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute MemberKidDTO kid_dto, HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/kidList");
		
		int cnt = dao.create(kid_dto);
		if(cnt==0) { //행추가 실패
			
			String msg1="<p>자녀 회원 등록 실패</p>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do" + "\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
			
		}else { //행추가 성공하면 목록페이지로 이동
			String msg1="<p>자녀 회원 등록 성공</p>";
			String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do" + "\"'>"; // 버튼 안 뜸
			
			mav.addObject("msg1", msg1);
			mav.addObject("link2", link2);
		}//if end

		return mav;
	}//createProc() end	
	
}// class end
