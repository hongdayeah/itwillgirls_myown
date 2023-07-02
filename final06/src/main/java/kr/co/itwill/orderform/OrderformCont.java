package kr.co.itwill.orderform;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONTokener;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.itwill.cart.CartDTO;
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
	public String orderInsert(@ModelAttribute OrderformDTO dto,
							  @RequestBody Map<String, Object> requestData,
							  HttpSession session, HttpServletRequest req) {
		
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		//System.out.println(memdto);
		
		
		//System.out.println(requestData.get("prolist"));
		//System.out.println(requestData.get("perlist"));

		@SuppressWarnings("unchecked")
		List<Map<String, Object>> prolist = (List<Map<String, Object>>) requestData.get("prolist");
		
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> perlist = (List<Map<String, Object>>) requestData.get("perlist");
		
		//System.out.println(prolist);
		//System.out.println(perlist);
		if(memdto==null) {
        	//만약 로그인되어 있지 않다면 로그인 창으로 감
            return "redirect:/member/login.do";        
         }	else { 
        	 
        	 String p_id = memdto.getP_id();
        	 int order_cnt = Integer.parseInt(requestData.get("order_cnt").toString());
        	 int tot_price = Integer.parseInt(requestData.get("tot_price").toString());
        	 //String per_name = requestData.get("pro_name").toString();
        	 //String pro_name = requestData.get("per_name").toString();
        	 //System.out.println("pid = " + p_id + " order_cnt = " + order_cnt + " tot_price = " + tot_price);
        	// prolist 처리
        	 for (Map<String, Object> pro : prolist) {
        	     // prolist의 각 항목에서 필요한 값을 추출
        	     String cart_no = pro.get("cart_no").toString();
        	     String pro_name = pro.get("pro_name").toString();
        	     String cart_cnt = pro.get("cart_cnt").toString();
        	     String cart_price = pro.get("cart_price").toString();
        	     String pro_obj = dao.pobjread(pro_name);

        	     // dao.insertprolist()를 호출하여 값 전달
        	     //dao.prodetail(cart_no, pro_name, pro_obj, cart_cnt, cart_price);
        	 }
        	 
        	// perlist 처리
        	 /*
        	 for (Map<String, Object> per : perlist) {
        	     // perlist의 각 항목에서 필요한 값을 추출
        	     String cart_no = per.get("cart_no").toString();
        	     String per_name = per.get("per_name").toString();
        	     String cart_cnt = per.get("cart_cnt").toString();
        	     String seat_no = per.get("seat_no").toString();
        	     String cart_price = per.get("cart_price").toString();

        	     // dao.insertperlist()를 호출하여 값 전달
        	     dao.perdetail(cart_no, per_name, cart_cnt, seat_no, cart_price);
        	 }
        	 */
        	 System.out.println(p_id);
        	 //System.out.println(per_name);
        	 //System.out.println(pro_name);
        	 int cnt = dao.orderInsert(p_id, order_cnt, tot_price);
        	 
        	 //String order_no = dto.getOrder_no();
        	 String order_no = null;
        	 if(cnt==0) {
        		 return "orderform에 정보 입력 실패";
        	 }else {
        		 order_no = dao.getorderno(p_id);
            	 //System.out.println(order_no);
        		 return order_no;
        	 }
        	 
         }//if end
	}//orderInsert() end
	
	@RequestMapping("/order/formRead")
	public ModelAndView read(HttpSession session,
							@RequestParam(value = "prolist", required = false) String prolistJson,
					        @RequestParam(value = "perlist", required = false) String perlistJson) {
		
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		//System.out.println(memdto);
		
		String p_id = memdto.getP_id();
		//System.out.println(p_id);
		ModelAndView mav = new ModelAndView();
		
		
		OrderformDTO dto = dao.orderRead(p_id);
		mav.addObject("dto", dto);
		
		// 장바구니에서 선택한 program, performance 정보
		// JSON 문자열을 prolist 배열로 변환
		/*
	    List<CartDTO> prolist = new ArrayList<>();
	    if (prolistJson != null && !prolistJson.isEmpty()) {
	    	try {
	            JSONTokener tokener = new JSONTokener(prolistJson);
	            JSONArray jsonArray = new JSONArray(tokener);
	            
	            for (int i = 0; i < jsonArray.length(); i++) {
	                JSONObject jsonObject = jsonArray.getJSONObject(i);
	                
	                CartDTO prodto = new CartDTO();
	                prodto.setPro_name(jsonObject.getString("pro_name"));
	                prodto.setCart_cnt(jsonObject.getInt("cart_cnt"));
	                prodto.setCart_price(jsonObject.getInt("cart_price"));
	                
	                prolist.add(prodto);
	            }
	        } catch (JSONException e) {
	            // JSON 파싱 오류 처리
	        	System.out.println("OrderformCont에서 prolist json 오류 : " + e);
	        }
	    }//if end
		
	    //JSON 문자열을 perlist 배열로 변환
	    List<CartDTO> perlist = new ArrayList<>();
	    if(perlistJson != null && !perlistJson.isEmpty()) {
	    	try {
	    		JSONTokener tokener = new JSONTokener(perlistJson);
	    		JSONArray jsonArray = new JSONArray(tokener);
	    		
	    		for(int i = 0; i < jsonArray.length(); i++) {
	    			JSONObject jsonObject = jsonArray.getJSONObject(i);
	    			
	    			CartDTO perdto = new CartDTO();
	    			perdto.setPer_name(jsonObject.getString("per_name"));
	    			perdto.setCart_cnt(jsonObject.getInt("cart_cnt"));
	    			perdto.setCart_price(jsonObject.getInt("cart_price"));
	    			
	    			perlist.add(perdto);
	    		}
	    	}catch(JSONException e) {
	    		System.out.println("OrderformCont에서 perlist json 오류 : " + e);
	    	}
	    }//if end
		
	    
	    mav.addObject("prolist", prolist);
	    mav.addObject("perlist", perlist);
		System.out.println(prolist);
		*/
		
		//orderForm으로 넘어갔을 때 orderform의 order_no 업데이트하기
		//1.해당 p_id의  
		String order_no = dto.getOrder_no();
		//int cnt = dao.cartupdate(order_no);
		
		mav.setViewName("order/formRead");
		
		return mav;
	}//list() end
	
	//결제 성공시 장바구니에서 자동삭제
    @RequestMapping(value="/orderform/delete.do", method= {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String cartDelete(@RequestParam("order_no") String order_no) {
    	//System.out.println(order_no);
    	
    	int cnt1 = dao.delete(order_no);
    	
    	int cnt2 = dao.update(order_no);
    	
    	if(cnt1==0 && cnt2==0) {
    		return "장바구니에서 삭제 및 오더폼 결제상태 수정 실패했습니다";
    	}else {
    		return "주문한 건은 장바구니에서 자동삭제 됩니다.";
    	}
    	
    }//cartDelete() end
	
    @RequestMapping(value="order/myorderlist", method=RequestMethod.GET)
    @ResponseBody
    public ModelAndView myorderlist(@RequestParam("order_no") String order_no,
    								@RequestParam("order_cnt") int order_cnt,
    								@RequestParam("tot_price") int tot_price, HttpSession session) {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("order/myorderlist");
    	
    	return mav;
    }//myorderlist() end
}//class end
