package kr.co.itwill.protime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProtimeCont {

	@Autowired
	private ProtimeDAO dao;
	
	public ProtimeCont() {
		System.out.println("-----ProtimeCont()객체 생성됨");
	}
	
	//프로그램 시간표 등록
	@RequestMapping(value="/programtime/create.do", method=RequestMethod.GET)
	public ModelAndView createForm(String pro_obj, String pro_name) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("programtime/createForm");
		mav.addObject("pro_obj", pro_obj);
		mav.addObject("pro_name", pro_name);
		
		return mav;
	}//createForm() end
}
