package kr.co.itwill.program;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.protime.ProtimeDTO;
import net.utility.UploadSaveManager;

@Controller
public class ProgramCont {
	
	@Autowired
	private ProgramDAO dao;
	
	public ProgramCont() {
		System.out.println("-----ProgramCont()객체 생성됨");
	}
	
	//목록
	@RequestMapping("/program/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/list2");
		List<ProgramDTO> list = dao.list();
		mav.addObject("list", list);
		
		return mav;
	}//list() end
	
	//프로그램 등록
	@RequestMapping(value="/program/create.do", method=RequestMethod.GET)
	public ModelAndView createForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/createForm");
		
		return mav;
	}//createForm() end
	
	@RequestMapping(value="/program/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute ProgramDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/msgView");
		
		MultipartFile pro_posterMF = dto.getPro_posterMF();
		MultipartFile pro_imgMF = dto.getPro_imgMF();
		String pro_poster = pro_posterMF.getOriginalFilename();
		String pro_img = pro_imgMF.getOriginalFilename();
		dto.setPro_poster(pro_poster);
		dto.setPro_img(pro_img);
		
		int cnt = dao.create(dto);
		
		if(cnt==0) {
			mav.setViewName("program/msgView");
			String msg1 = "<p>프로그램 등록 실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>"; //수정
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		}else {
			String msg1 = "<p>프로그램 등록 성공</p>";
			mav.addObject("msg1", msg1);
			String link1 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			mav.addObject("link1",link1);
		}//if end
		
		return mav;
	}//createProc() end
	
	//상세보기
	@RequestMapping("/program/read.do")
	public ModelAndView read(String pro_obj) {
		ModelAndView mav = new ModelAndView();
		ProgramDTO dto = dao.read(pro_obj);
		mav.setViewName("program/read");
		
		mav.addObject("dto", dto);
		
		//ProramDAO에 선언한 ptread()함수 추가 (program_time에서 pro_obj=?인 행 조회)
		List<ProtimeDTO> ptlist = dao.ptlist(pro_obj);
		mav.addObject("ptlist", ptlist);
		
		//조회수 증가하는 함수
		dao.incrementCnt(pro_obj);
		
		return mav;
	}//read() end
	
	//수정
	@RequestMapping(value="/program/update.do", method=RequestMethod.GET)
	public ModelAndView update(String pro_obj) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/updateForm");
		ProgramDTO dto = dao.read(pro_obj);
		mav.addObject("dto", dto);
		
		return mav;
	}//update() end
	
	@RequestMapping(value="/program/update.do", method=RequestMethod.POST)
	public ModelAndView updateProc(@ModelAttribute ProgramDTO dto, HttpServletRequest req) {
		MultipartFile pro_posterMF = dto.getPro_posterMF();
		MultipartFile pro_imgMF = dto.getPro_imgMF();
		
		String pro_poster = pro_posterMF.getOriginalFilename();
		String pro_img = pro_imgMF.getOriginalFilename();
		
		dto.setPro_poster(pro_poster);
		dto.setPro_img(pro_img);
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.update(dto);
		
		if(cnt==0) {
			mav.setViewName("program/msgView");
			String msg1 = "<p>수정실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		}else {
			mav.setViewName("redirect:/program/list.do");
		}//if end
		
		return mav;
	}//updateProc() end
	
}//class end
