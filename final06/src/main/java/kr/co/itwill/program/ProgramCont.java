package kr.co.itwill.program;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProgramCont {
	@Autowired
	private ProgramDAO dao;
	
	public ProgramCont() {
		System.out.println("-----ProgramCont()객체 생성됨");
	}
	
	@RequestMapping("/program/list.do")
	public ModelAndView list(String pro_obj) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/list");
		
		mav.addObject("list", dao.list(pro_obj));
		mav.addObject("pro_obj", pro_obj);
		
		return mav;
	}//list() end
}//class end
