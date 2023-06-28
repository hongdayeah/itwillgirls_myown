package kr.co.itwill.typeinfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TypeinfoCont {

	public TypeinfoCont() {
		System.out.println("-----TypeinfoCont()객체 생성됨");
	}
	
	@Autowired
	private TypeinfoDAO dao;
	
	//관리자 목록 조회
	@RequestMapping("/tendency/adminlist.do")
	public ModelAndView adminlist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tendency/adminlist");
		List<TypeinfoDTO> list = dao.list();
		mav.addObject("list", list);
		
		return mav;
	}//adminlist() end
	
	//성향 추가
	@RequestMapping(value="tendency/create.do", method=RequestMethod.GET)
	public ModelAndView createForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tendency/createForm");
		
		return mav;
	}//createForm() end
	
	@RequestMapping(value="/tendency/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute TypeinfoDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		MultipartFile typeimgMF = dto.getTypeimgMF();
		String typeimg = typeimgMF.getOriginalFilename();
		dto.setTypeimg(typeimg);
		
		int cnt = dao.create(dto);
		
		if(cnt==0) {
			System.out.println("mbti 등록 실패");
		}
		
		mav.setViewName("redirect:/tendency/adminlist.do");
		return mav;
	}//createProc() end
	
	//수정
	@RequestMapping(value="/tendency/update.do", method=RequestMethod.GET)
	public ModelAndView update(String typename) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tendency/updateForm");
		TypeinfoDTO dto = dao.read(typename);
		mav.addObject("dto", dto);
		mav.addObject("typename", typename);
		//System.out.println(dto);
		return mav;
	}//update() end
	
	@RequestMapping(value="tendency/update.do", method=RequestMethod.POST)
	public ModelAndView updateProc(@ModelAttribute TypeinfoDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		MultipartFile typeimgMF = dto.getTypeimgMF();
		String typeimg = typeimgMF.getOriginalFilename();
		dto.setTypeimg(typeimg);
		
		int cnt = dao.update(dto);
		if(cnt==0) {
			System.out.println("typeinfo 수정 실패");
		}
		mav.setViewName("redirect:/tendency/adminlist.do");
		return mav;
	}//updateProc() end
	
	//삭제
	@RequestMapping(value="tendency/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteProc(String typename) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.delete(typename);
		
		if(cnt==0) {
			System.out.println("typeifno 삭제 실패");
		}
		
		mav.setViewName("redirect:/tendency/adminlist.do");
		return mav;
	}//deleteProc() end
}//class end
