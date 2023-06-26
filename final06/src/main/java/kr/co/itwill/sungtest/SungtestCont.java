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
	
	
	
}//class end
