package kr.co.itwill.sungtest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

//관리자가 테스트 질문지 관리하는 cont
public class SungtestCont {

	public SungtestCont() {
		System.out.println("-----SungtestCont()객체 생성됨");
	}
	
	@Autowired 
	private SungtestDAO dao;
	
	////////////////관리자
	//관리자가 slist 볼 수 있는 목록
	@RequestMapping("/test/slist.do")
	public ModelAndView slist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/slist");
		
		return mav;
	}//slist() end
	
	
	
	//사용자가 테스트1부 하는 페이지
	@RequestMapping("/test/sungtest.do")
	public ModelAndView sungtest() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/sungtest");
		
		return mav;
	}//sungtest() end
	
}//class end
