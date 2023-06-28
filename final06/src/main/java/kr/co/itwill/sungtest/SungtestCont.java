package kr.co.itwill.sungtest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		List<SungtestDTO> list = dao.list();
		mav.addObject("slist", list);
		
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
		
		
		int cnt = dao.create(dto);
		
		if(cnt==0) {
			System.out.println("stest 질문 등록 실패");
		}
		mav.setViewName("redirect:/test/slist.do");
		return mav;
	}//screateProc() end
	
	
	//질문 수정
	@RequestMapping(value="/test/supdate.do", method=RequestMethod.GET)
	public ModelAndView update(int stest_no) {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("test/supdateForm");
		SungtestDTO dto = dao.read(stest_no);
		mav.addObject("dto", dto);
		mav.addObject("stest_no", stest_no);
		
		return mav;
	}//update() end
	
	@RequestMapping(value="/test/supdate.do", method=RequestMethod.POST)
	public ModelAndView updateProc(int stest_no, @ModelAttribute SungtestDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		//System.out.println(stest_no);
		
		int cnt = dao.update(dto);
		
		if(cnt==0) {
			System.out.println("stest 질문 수정 실패");
		}
		
		mav.setViewName("redirect:/test/slist.do");
		
		return mav;
	}//updateProc() end
	
	//질문 삭제
	@RequestMapping(value="/test/sdelete.do", method=RequestMethod.GET)
	public ModelAndView deleteProc(int stest_no) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.delete(stest_no);
		
		if(cnt==0) {
			System.out.println("stest 질문 삭제 실패");
		}
		
		mav.setViewName("redirect:/test/slist.do");
		
		return mav;
		
	}//deleteProc() end
	
	
	////////////////////////////////////////////////사용자
	//사용자가 테스트[1부] 하는 페이지
	@RequestMapping("/test/sungtest.do")
	public ModelAndView sungtest(@RequestParam("k_no") int k_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/sungtest");
		
		//System.out.println(k_no);
		
		//SungtestDAO에 선언한 sknameread(k_no) 호출 (k_name 찾기)
		String k_name = dao.sknameread(k_no);
		//System.out.println(k_name);
		mav.addObject("k_no", k_no);
		mav.addObject("k_name", k_name);
		
		//사용자에게 랜덤한 sungtest 내의 10개의 질문 보여주기
		//처음엔 List<SungtestDTO> 타입으로 불렀더니 행 전체를 불러왔다. 난 stest_name만 필요해서 <String>으로 선언
		List<String> srandlist = dao.srandlist(10);
		//System.out.println(srandlist);
		
		mav.addObject("srandlist", srandlist);
		
		return mav;
	}//sungtest() end
	
}//class end
