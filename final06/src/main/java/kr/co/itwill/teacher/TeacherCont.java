package kr.co.itwill.teacher;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeacherCont {
	
	@Autowired
	private TeacherDAO dao;
	
	public TeacherCont() {
		System.out.println("-----TeacherCont() 객체 생성됨");
	}
	
	/*
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("teacher/list");
		mav.addObject("list",dao.list());

		return mav;
	}//list() end
	*/
	
	//강사 등록
	//http://localhost:9095/teacher/create.do
	@RequestMapping(value="teacher/create.do", method=RequestMethod.GET)
	public String createForm() {
		return "teacher/createForm";
	}//createForm() end
	
	@RequestMapping(value="teacher/create.do", method = RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute TeacherDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.create(dto);
		if(cnt==0) {
			mav.setViewName("teacher/msgView");
			String msg1 = "<p>강사 등록 실패</p>";
		}else {
			mav.setViewName("redirect:/teacher/list.do");
		}//if end
		return mav;
	}//createProc() end
	
	@RequestMapping("teacher/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacher/list");
		List<TeacherDTO> list = dao.list();
		mav.addObject("list", list);
		
		return mav;
	}//list() end
	
}//class end
