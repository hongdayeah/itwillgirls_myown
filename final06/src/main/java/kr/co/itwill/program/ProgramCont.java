package kr.co.itwill.program;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/program")
public class ProgramCont {
	@Autowired
	private ProgramDAO dao;
	
	public ProgramCont() {
		System.out.println("-----ProgramCont()객체 생성됨");
	}
	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("program/list");

		return mav;
	}//list() end
	
	@RequestMapping("/create")
	public String create() {
		return "program/create";
	}//create() end
	
	
}//class end
