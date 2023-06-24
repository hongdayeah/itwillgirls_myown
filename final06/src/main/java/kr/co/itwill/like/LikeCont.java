package kr.co.itwill.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.program.ProgramDTO;

@Controller
public class LikeCont {

	@Autowired
	private LikeDAO dao;
	
	public LikeCont() {
		System.out.println("-----LikeCont()객체 생성됨");
	}
	
	//관심프로그램 등록(찜 insert)
	@RequestMapping("program/likeInsert.do")
	@ResponseBody //성공하면 본문의 ajax -> success로 이동 ??
	public String likeInsert(@RequestParam("pro_obj") String pro_obj, @RequestParam("p_id") String p_id, @ModelAttribute LikeDTO likedto) {
		System.out.println("1111");
		System.out.println(pro_obj);
		System.out.println(p_id);
		System.out.println(likedto);
		
		//ajax에서 pro_obj로 받은 것을 여기서 String pro_obj, p_id로 받은 것을 여기서 String p_id로 쓰겠다
		
		//ModelAndView mav = new ModelAndView();
		//mav.addAttribute("pro_obj", pro_obj);
		//mav.
		//LikeDAO에 선언한 memread()함수 추가
		//MemberDTO memdto = dao.memread(p_id);
		
		//LikeDAO에 선언한 proread()함수 추가
		//ProgramDTO prodto = dao.proread(pro_obj);
		
		//찜 추가
		int cnt = dao.create(likedto);
		
		if(cnt==0) {
			return "실패!!";
		}else {
			return "성공!!";
		}//if end
		
		
		
	}//likeInsert() end
	
}//class end
