package kr.co.itwill.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LikeCont {

	@Autowired
	private LikeDAO dao;
	
	public LikeCont() {
		System.out.println("-----LikeCont()객체 생성됨");
	}
	
	//관심프로그램 등록(찜하기)
	@RequestMapping(value="/program/like.do", method=RequestMethod.GET)
	public ModelAndView likeInsert(String p_id, String pro_obj) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("likeprogram/likeInsert");
		
		mav.addObject("p_id", p_id);
		mav.addObject("pro_obj", pro_obj);
		
		return mav;
	}//likeInsert() end
}//class end
