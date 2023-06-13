package kr.co.itwill.performance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PerformanceCont {
	
	@Autowired
	private PerformanceDAO dao;
	
	public PerformanceCont() {
		System.out.println("-----Performance() 객체 생성됨");
	} //end
	
	@RequestMapping("/performance/list.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("performance/list");

		return mav;
	}//list() end
	
	
	@RequestMapping(value = "/performance/create.do", method = RequestMethod.GET)
    public ModelAndView createForm(String percode) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("performance/createForm");
        mav.addObject("per_code", percode); //부모글번호
        return mav;
    }//createForm() end
	

}
