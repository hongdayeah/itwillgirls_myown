package kr.co.itwill.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String perInsert(@ModelAttribute CartDTO dto, HttpSession session) {
		
		// 로그인 성공 했을 때 로그인 정보는 세션에 올려진 상태
		// 로그인 한 p_id 가져오기
		Object obj = session.getAttribute("member_dto");
	    MemberDTO mDto = (MemberDTO) obj;
	   // System.out.println(mDto);
      	
      	if(mDto==null) {
      		return "redirect:/member/login.do";  		
      	}else { 
      		String p_id = mDto.getP_id(); // mDto에서 p_id값 가져옴	 
      		
      		dto.setP_id(p_id); // dto에 p_id 설정
      		
      		dao.perInsert(dto);
      		//p_id 값 안넘어옴! 이거부터 하기
      		return "/cart/list";	
      	}
	
	}//perInsert end


	
	
	
}
