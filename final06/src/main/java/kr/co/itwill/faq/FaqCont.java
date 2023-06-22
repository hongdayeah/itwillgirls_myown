package kr.co.itwill.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/faq")
public class FaqCont {

	@Autowired
	private FaqDAO dao;
	
	public FaqCont() {
		System.out.println("-----FaqCont() 객체 생성됨");
	}//end
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public ModelAndView faqForm(Integer f_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("faq/faqForm");
		mav.addObject("f_no", f_no);
		return mav;
	}
}
