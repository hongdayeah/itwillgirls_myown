package PerformanceSeat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PerformanceSeatCont {

	@Autowired
	private PerformanceSeatDAO dao;
	
	public PerformanceSeatCont() {
		System.out.println("-----PerformanceSeatDAO() 객체 생성됨");
	} //end

	@RequestMapping("/performanceSeat/seatList.do")
	public ModelAndView seatList() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/performanceSeat/seatList");
		
		return mav;
		
		
	}
	
	
	
	}
	

	

