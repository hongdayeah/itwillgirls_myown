package kr.co.itwill.orderform;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;

@Controller
public class OrderformCont {

	@Autowired
	private OrderformDAO dao;
	
	public OrderformCont() {
		System.out.println("-----OrderformCont()객체 생성됨");
	}
	
	//주문 폼에 보여질 정보 등록
	@RequestMapping(value="cart/orderForm.do", method=RequestMethod.POST)
	@ResponseBody
	public String orderInsert(@ModelAttribute OrderformDTO dto, HttpSession session, HttpServletRequest req) {
		
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		//System.out.println(memdto);
		
		if(memdto==null) {
        	//만약 로그인되어 있지 않다면 로그인 창으로 감
            return "redirect:/member/login.do";        
         }	else { 
        	 
        	 String p_id = memdto.getP_id();
        	 int order_cnt = Integer.parseInt(req.getParameter("order_cnt"));
        	 int tot_price = Integer.parseInt(req.getParameter("tot_price"));
        	 
        	 //System.out.println("pid = " + p_id + " order_cnt = " + order_cnt + " tot_price = " + tot_price);
        	 
        	 int cnt = dao.orderInsert(p_id, order_cnt, tot_price);
        	 
        	 if(cnt==0) {
        		 return "orderform에 정보 입력 실패";
        	 }else {
        		 return "주문 창으로 넘어갑니다.";
        	 }
        	 
         }//if end
	}//orderInsert() end
	
	@RequestMapping("/order/formRead")
	public ModelAndView read(HttpSession session) {
		
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		//System.out.println(memdto);
		
		String p_id = memdto.getP_id();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/formRead");
		OrderformDTO dto = dao.orderRead(p_id);
		mav.addObject("dto", dto);
		
		return mav;
	}//list() end
}//class end
