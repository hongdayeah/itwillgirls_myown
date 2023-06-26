package kr.co.itwill.sungtest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SungtestCont {

	public SungtestCont() {
		System.out.println("-----SungtestCont()객체 생성됨");
	}
	
	@Autowired 
	private SungtestDAO sdao;
	
	@RequestMapping("/test/main.do")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("test/main");
		
		return mav;
	}//main() end
	
}//class end
