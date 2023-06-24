package kr.co.itwill.protime;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.classroom.ClassroomDTO;
import kr.co.itwill.program.ProgramDAO;
import kr.co.itwill.program.ProgramDTO;
import kr.co.itwill.teacher.TeacherDTO;

@Controller
public class ProtimeCont {

	@Autowired
	private ProtimeDAO dao;
	
	@Autowired
	private ProgramDAO prodao; //사용 안함
	
	public ProtimeCont() {
		System.out.println("-----ProtimeCont()객체 생성됨");
	}
	
	//프로그램 시간표 등록
	@RequestMapping(value="/programtime/create.do", method=RequestMethod.GET)
	public ModelAndView createForm(String pro_obj) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("programtime/createForm");
		mav.addObject("pro_obj", pro_obj);
		
		//ProtimeDAO에 선언한 tlist()함수 추가
		List<TeacherDTO> tlist = dao.tlist();
		//createForm에서 내가 만든 tdto로 불러올수 있게 함?
		mav.addObject("tdto", tlist);
		
		//ProtimeDAO에 선언한 clist()함수 추가
		List<ClassroomDTO> clist = dao.clist();
		mav.addObject("cdto", clist);
		
		return mav;
	}//createForm() end
	
	@RequestMapping(value="/programtime/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(String pro_obj, @ModelAttribute ProtimeDTO ptdto) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.create(ptdto);
		
		if(cnt==0) {
			mav.setViewName("programtime/msgView");
			String msg1 = "<p>프로그램 시간표 등록 실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			//String link2 = "<input type='button' value='목록으로' onclick='location.href=\"../program/read.do?pro_obj=\"'>"; //수정
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			//mav.addObject("link2", link2);
		}else {
			mav.setViewName("redirect:/program/read.do?pro_obj="+pro_obj);
		}//if end
		
		return mav;
		
	}//createProc() end

}//class end
