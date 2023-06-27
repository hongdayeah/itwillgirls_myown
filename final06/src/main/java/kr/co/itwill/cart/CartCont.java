package kr.co.itwill.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	//
	@RequestMapping(value="performance/perInsert.do")
	public String perInsert(@ModelAttribute CartDTO dto,HttpSession session,HttpServletRequest request) {
		
		// 로그인 성공 했을 때 로그인 정보는 세션에 올려진 상태
		// 로그인 한 p_id 가져오기
		Object obj = session.getAttribute("member_dto");
	    MemberDTO mDto = (MemberDTO) obj;
	    //System.out.println(mDto);
      	
      	if(mDto==null) {
      		return "redirect:/member/login.do";  		
      	}else { 
      		String p_id = mDto.getP_id(); // mDto에서 p_id값 가져옴	 
      		
      		String per_code=request.getParameter("per_code");	//HttpServletRequest 통해서 per_code 받아옴
      		String seat_no=request.getParameter("arrSeat");		//HttpServletRequest 통해서 arrSeat 받아옴
      															
      		
      		//CartDTO dto=new CartDTO();
      		
      		dto.setP_id(p_id); 			// dto에 p_id 설정
      		dto.setPer_code(per_code);	// dto에 per_code 설정
      		dto.setSeat_no(seat_no);	// dto에 seat_no 설정
      			
      		dao.perInsert(dto);
      		return "/cart/list";	
      	}
	
	}//perInsert end


	
	
	
}
