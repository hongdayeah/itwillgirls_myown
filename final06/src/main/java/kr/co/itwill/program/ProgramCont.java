package kr.co.itwill.program;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProgramCont {
	
	@Autowired
	private ProgramDAO dao;
	
	public ProgramCont() {
		System.out.println("-----ProgramCont()객체 생성됨");
	}
	
	//목록
	@RequestMapping("/program/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/list");
		List<ProgramDTO> list = dao.list();
		mav.addObject("list", list);
		
		return mav;
	}//list() end
	
	//프로그램 등록
	@RequestMapping(value="/program/create.do", method=RequestMethod.GET)
	public ModelAndView createForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/createForm");
		
		return mav;
	}//createForm() end
	
	
	
}//class end
