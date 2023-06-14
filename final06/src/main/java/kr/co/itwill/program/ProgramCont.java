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
	
}//class end
