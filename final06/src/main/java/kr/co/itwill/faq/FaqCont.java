package kr.co.itwill.faq;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/faq")
public class FaqCont {

	@Autowired
	private FaqDAO dao;
	
	public FaqCont() {
		System.out.println("-----FaqCont() 객체 생성됨");
	}//end
	
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("faq/faqList");
		
		mav.addObject("list", dao.list());
		
		return mav;
	}//list() end
	
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public ModelAndView createForm(Integer f_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("faq/faqForm");
		mav.addObject("f_no", f_no);
		return mav;
	}//createForm() end
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute FaqDTO dto, HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("faq/msgView");
		
		int cnt=dao.create(dto);
		if(cnt==0) {
			String msg1="<p>FAQ 등록실패</p>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='목록으로' onclick='location.href='/faq/list.do'>";
	        mav.addObject("msg1", msg1);
	        mav.addObject("link1", link1); 
	        mav.addObject("link2", link2); 
		} else {
			 String msg1="<p>FAQ 등록완료</p>";
			 mav.addObject("msg1", msg1);
			 String link1="<input type='button' value='목록으로' onclick=#>";
			 mav.addObject("link1", link1); 
			}//if end
		return mav; 
		}//createProc() end









}
