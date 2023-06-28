package kr.co.itwill.hyangtest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.sungtest.SungtestDTO;

//관리자가 테스트 질문지 관리하는 cont
@Controller
public class HyangtestCont {

	@Autowired
	private HyangtestCont() {
		System.out.println("-----HyangtestCont()객체 생성됨");
	}
	
	@Autowired
	private HyangtestDAO dao;
	
	////////////////////////////////////////////////관리자
	//관리자가 hlist 볼 수 있는 목록
	@RequestMapping("/test/hlist.do")
	public ModelAndView hlist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/hlist");
		List<HyangtestDTO> list = dao.list();
		mav.addObject("hlist", list);
		
		return mav;
	}//hlist() end
	
	//질문 추가
	@RequestMapping(value="/test/hcreate.do", method=RequestMethod.GET)
	public ModelAndView hcreateForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/hcreateForm");
		
		return mav;
	}//hcreateForm() end
	
	@RequestMapping(value="/test/hcreate.do", method=RequestMethod.POST)
	public ModelAndView hcreateProc(@ModelAttribute HyangtestDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		
		int cnt = dao.create(dto);
		
		if(cnt==0) {
			System.out.println("stest 질문 등록 실패");
		}
		mav.setViewName("redirect:/test/hlist.do");
		return mav;
	}//hcreateProc() end
	
	//질문 수정
	@RequestMapping(value="/test/hupdate.do", method=RequestMethod.GET)
	public ModelAndView update(int htest_no) {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("test/hupdateForm");
		HyangtestDTO dto = dao.read(htest_no);
		mav.addObject("dto", dto);
		mav.addObject("htest_no", htest_no);
		
		return mav;
	}//update() end
	
	@RequestMapping(value="/test/hupdate.do", method=RequestMethod.POST)
	public ModelAndView updateProc(int htest_no, @ModelAttribute HyangtestDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		//System.out.println(htest_no);
		
		int cnt = dao.update(dto);
		
		if(cnt==0) {
			System.out.println("htest 질문 수정 실패");
		}
		
		mav.setViewName("redirect:/test/hlist.do");
		
		return mav;
	}//updateProc() end
	
	//질문 삭제
	@RequestMapping(value="/test/hdelete.do", method=RequestMethod.GET)
	public ModelAndView deleteProc(int htest_no) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.delete(htest_no);
		
		if(cnt==0) {
			System.out.println("htest 질문 삭제 실패");
		}
		
		mav.setViewName("redirect:/test/hlist.do");
		
		return mav;
	}//deleteProc() end
	
	
	
}//class end
