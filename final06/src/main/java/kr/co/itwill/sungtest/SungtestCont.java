package kr.co.itwill.sungtest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	////////////////////////////////////////////////관리자
	//관리자가 slist 볼 수 있는 목록
	@RequestMapping("/test/slist.do")
	public ModelAndView slist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/slist");
		//List<SungtestDTO> slist = dao.slist();
		//mav.addObject("slist", slist);
		return mav;
	}//slist() end
	
	//질문 추가
	@RequestMapping(value="/test/screate.do", method=RequestMethod.GET)
	public ModelAndView screateForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/screateForm");
		
		return mav;
	}//screateForm() end
	
	@RequestMapping(value="/test/screate.do", method=RequestMethod.POST)
	public ModelAndView screateProc(@ModelAttribute SungtestDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/slist");
		
		int cnt = dao.create(dto);
		
		if(cnt==0) {
			System.out.println("stest 질문 등록 실패");
		}
		
		return mav;
	}//screateProc() end
	
	////////////////////////////////////////////////사용자
	//사용자가 테스트1부 하는 페이지
	@RequestMapping("/test/sungtest.do")
	public ModelAndView sungtest() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/sungtest");
		
		return mav;
	}//sungtest() end
	
}//class end
