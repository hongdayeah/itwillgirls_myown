package kr.co.itwill.cart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;

@Controller
public class CartCont {

	@Autowired
	private CartDAO dao;
	
	public CartCont() {
		System.out.println("-----CartCont() 객체 생성됨");
	}//end
	
	@RequestMapping("performance/perInsert.do")
	public ModelAndView perInsert(HttpSession session) {
		
		// 로그인 성공 했을 때 로그인 정보는 세션에 올려진 상태
		 Object obj = session.getAttribute("member_dto");
	     MemberDTO mDto = (MemberDTO) obj;

      	
      	ModelAndView mav=new ModelAndView();
      	
      	if(mDto==null) {
      		mav.setViewName("/member/loginForm");
      	}else {
      		mav.setViewName("/cart/list");
		
      	}
      	
      	return mav;
      	
	}//perInsert end


	
	
	
}
