package kr.co.itwill.cart;

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
import kr.co.itwill.performance.PerformanceDTO;
import kr.co.itwill.program.ProgramDTO;
import kr.co.iwill.performanceSeat.PerformanceSeatDTO;

@Controller
public class CartCont {

	@Autowired
	private CartDAO dao;
	
	public CartCont() {
	      System.out.println("-----CartCont() 객체 생성됨");
	   }//end
	   
	   
	   @RequestMapping(value="performance/perInsert.do")
	   @ResponseBody
	   public String perInsert(@ModelAttribute CartDTO dto,@ModelAttribute PerformanceSeatDTO perseatdto,HttpSession session,HttpServletRequest request) {
	      
	      // 로그인 성공 했을 때 로그인 정보는 세션에 올려진 상태
	      // 로그인 한 p_id 가져오기
	      Object obj = session.getAttribute("member_dto");
	       MemberDTO mDto = (MemberDTO) obj;
	       //System.out.println(mDto);
	     
	       
         if(mDto==null) {
        	//만약 로그인되어 있지 않다면 로그인 창으로 감
            return "redirect:/member/login.do";        
         }	else { 
        	 
            String p_id = mDto.getP_id(); 						// mDto에서 p_id값 가져옴    
            
            String per_code=request.getParameter("per_code");   //HttpServletRequest 통해서 per_code 받아옴
            String seat_no=request.getParameter("arrSeat");     //HttpServletRequest 통해서 arrSeat 받아옴
            int cart_cnt=Integer.parseInt(request.getParameter("pernum"));
            String alertSeat=request.getParameter("alertSeat");
            int per_fee=Integer.parseInt(request.getParameter("per_fee"));
            String per_name = request.getParameter("per_name");
            
            //System.out.println("d "+per_cnt+"d "+alertSeat+"d "+per_code+"d "+seat_no+"d"+per_fee);
            
            
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

	       //dao.perInsert(dto);
	       int cnt=dao.perInsert2(p_id, per_code, seat_no, cart_cnt, per_fee, per_name);
	       //System.out.println(per_name);
	       
	       if(cnt==0) {
	    		return "프로그램 장바구니에 담기 실패";
	    	}else {
	    		return "장바구니에 담았습니다\n장바구니로 이동합니다.";
	    	}
              
	            
	         }//cartInsert() end
	   }//perInsert end   	
      	
    @RequestMapping("/cart/list")
    public ModelAndView list(HttpSession session) {
    
		Object obj = session.getAttribute("member_dto");
	    MemberDTO mDto = (MemberDTO) obj;
	    
	    String p_id = mDto.getP_id();
	   
	    ModelAndView mav=new ModelAndView();
	    mav.setViewName("cart/list");
	    //mav.addObject("list", dao.cartList(p_id));
	    
	    mav.addObject("p_id", p_id);
	    
	    //p_id가 예매한 pro_code에 해당하는 pro_name,pro_fee 가져오기
	    //List<ProgramDTO> pronamelist = dao.pronamelist(p_id);
	    //System.out.println(pronamelist);
	    //mav.addObject("pronamelist", pronamelist);
	    
	    //p_id = ? 이고 pro_code가 not null인 cartlist 조회
	    List<CartDTO> prolist = dao.prolist(p_id);
	    mav.addObject("prolist", prolist);
	    
	    //p_id = ? 이고 per_code가 not null인 cartlist 조회
	    List<CartDTO> perlist = dao.perlist(p_id);
	    mav.addObject("perlist", perlist);
	    //System.out.println(perlist);
	    return mav;
	} //list() end
    

    //프로그램 정보 장바구니에 담기
    @RequestMapping(value="program/proInsert.do", method=RequestMethod.POST)
    @ResponseBody
    public String proInsert(@RequestParam("pro_code") String pro_code, @RequestParam("pro_cnt") int cart_cnt, @RequestParam("pro_fee") int pro_fee, @RequestParam("pro_name") String pro_name,  HttpSession session) {
    	
    	//로그인 한 p_id 가져오기
    	Object obj = session.getAttribute("member_dto");
    	MemberDTO memdto = (MemberDTO) obj;
    	
    	String p_id = memdto.getP_id();
    	
    	//System.out.println(p_id);
    	//System.out.println(pro_code);
    	//int pro_cnt = Integer.parseInt(selectcnt);
    	//System.out.println(pro_name);
    	
    	int cnt = dao.proInsert(p_id, pro_code, cart_cnt, pro_fee, pro_name);
    	
    	if(cnt==0) {
    		return "프로그램 장바구니에 담기 실패";
    	}else {
    		return "장바구니에 담았습니다\n장바구니로 이동합니다.";
    	}
    	
    }//proInsert() end
	
    
    //장바구니 삭제(결제전)
    @RequestMapping(value="/cart/cartDelete.do", method= {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String cartDelete(@RequestParam("cart_no") int cart_no) {
    	//System.out.println(cart_no);
    	
    	int cnt = dao.delete(cart_no);
    	
    	if(cnt==0) {
    		return "장바구니에서 삭제 실패했습니다";
    	}else {
    		return "장바구니에서 삭제됐습니다.";
    	}
    }//cartDelete() end
    
}//class end
