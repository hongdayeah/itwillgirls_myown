package kr.co.itwill.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartCont {

	@Autowired
	private CartDAO dao;
	
	public CartCont() {
		System.out.println("-----CartCont() 객체 생성됨");
	}//end
	
	@RequestMapping("performance/perInsert.do")
	public ModelAndView perInsert() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/cart/list");
		
		return mav;
	}
	
	
	
}
