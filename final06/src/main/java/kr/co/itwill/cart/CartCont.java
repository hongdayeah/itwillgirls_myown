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
import kr.co.iwill.performanceSeat.PerformanceSeatDTO;

@Controller
public class CartCont {

	@Autowired
	private CartDAO dao;
	
	public CartCont() {
	      System.out.println("-----CartCont() 객체 생성됨");
	   }//end
	   
	   
	   @RequestMapping(value="performance/perInsert.do")
	   public String perInsert(@ModelAttribute CartDTO dto,@ModelAttribute PerformanceSeatDTO perseatdto,HttpSession session,HttpServletRequest request) {
	      
	      // 로그인 성공 했을 때 로그인 정보는 세션에 올려진 상태
	      // 로그인 한 p_id 가져오기
	      Object obj = session.getAttribute("member_dto");
	       MemberDTO mDto = (MemberDTO) obj;
	       //System.out.println(mDto);
	         
         if(mDto==null) {
            return "redirect:/member/login.do";        
         }else { 
            String p_id = mDto.getP_id(); 						// mDto에서 p_id값 가져옴    
            
            String per_code=request.getParameter("per_code");   //HttpServletRequest 통해서 per_code 받아옴
            String seat_no=request.getParameter("arrSeat");     //HttpServletRequest 통해서 arrSeat 받아옴
            
            //seat_no값을 장바구니에 보이려고 하나의 문자열로 받아왔기 때문에 쉼표로 구분하여 배열에 저장한다
            String[] seatArray=seat_no.split(","); 				
            
            //seat변수는 seatArray 배열의 각요소를 순회하며 해당 요소를 나타내는 변수임
            for(String seat : seatArray) {
            	int row=Integer.parseInt(seat.substring(0,1)); 	//좌석 번호의 첫번째 문자 (행)
            	int col=Integer.parseInt(seat.substring(1)); 	//좌석 번호의 두번째 문자 (열)
            	
            	perseatdto.setPer_code(per_code);
 	            perseatdto.setRow(row);
 	            perseatdto.setCol(col);
 	            
 	            dao.seatInsert(perseatdto);
           }	            
            
	       dto.setP_id(p_id);          // dto에 p_id 설정
	       dto.setPer_code(per_code);   // dto에 per_code 설정
	       dto.setSeat_no(seat_no);   // dto에 seat_no 설정
            
	       dao.perInsert(dto);
           return "redirect:/cart/list";   
	            
	         }//cartInsert() end
	   }//perInsert end   	
      	
    @RequestMapping("/cart/list")
    public ModelAndView list(HttpSession session) {
    
		Object obj = session.getAttribute("member_dto");
	    MemberDTO mDto = (MemberDTO) obj;
	    
	    String p_id = mDto.getP_id();
	    
	    ModelAndView mav=new ModelAndView();
	    mav.setViewName("cart/list");
	    mav.addObject("list", dao.cartList(p_id));
	    
	    return mav;
	} //list() end
    
      	
	
	


	
	
	
}
