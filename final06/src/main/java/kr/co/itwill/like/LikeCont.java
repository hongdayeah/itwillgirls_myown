package kr.co.itwill.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;

@Controller
public class LikeCont {

	@Autowired
	private LikeDAO dao;
	
	public LikeCont() {
		System.out.println("-----LikeCont()객체 생성됨");
	}
	/*
	//관심프로그램 등록(찜 insert)
	@RequestMapping(value="program/likeInsert.do", method=RequestMethod.POST)
	@ResponseBody //성공하면 본문의 ajax -> success로 이동 ??
	public ModelAndView likeInsert(@RequestParam("pro_obj") String pro_obj, @RequestParam("p_id") String p_id) {
		//ajax에서 pro_obj로 받은 것을 여기서 String pro_obj, p_id로 받은 것을 여기서 String p_id로 쓰겠다
		
		ModelAndView mav = new ModelAndView();
		
		//LikeDAO에 선언한 memread()함수 추가
		MemberDTO memdto = dao.memread();
		
				
		
		
	}//likeInsert() end
	*/
}//class end
