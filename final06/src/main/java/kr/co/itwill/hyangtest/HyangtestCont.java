package kr.co.itwill.hyangtest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//관리자가 테스트 관리하는 cont
@Controller
public class HyangtestCont {

	@Autowired
	private HyangtestCont() {
		System.out.println("-----HyangtestCont()객체 생성됨");
	}
	
	//관리자가 hlist 볼 수 있는 목록
	@RequestMapping("/test/hlist.do")
	public ModelAndView hlist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/hlist");
		
		return mav;
	}//hlist() end
}//class end
