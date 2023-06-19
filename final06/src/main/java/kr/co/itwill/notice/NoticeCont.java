package kr.co.itwill.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/notice")
public class NoticeCont {

	@Autowired
	private NoticeDAO dao;
	
	public NoticeCont() {
		System.out.println("-----NoticeCont() 객체 생성됨");
	}//end
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public ModelAndView createForm(String not_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/createForm");
		mav.addObject("not_no", not_no);
		return mav;
	}//createForm() end
}
