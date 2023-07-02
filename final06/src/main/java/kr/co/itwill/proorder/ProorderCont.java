package kr.co.itwill.proorder;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.perorder.PerorderDTO;

@Controller
public class ProorderCont {

	@Autowired
	private ProorderDAO dao;
	
	public ProorderCont() {
		System.out.println("-----ProorderCont()객체 생성됨");
	}
	
	//예매내역 목록
	@RequestMapping(value="order/myorderlist", method=RequestMethod.GET)
    @ResponseBody
    public ModelAndView myorderlist(HttpSession session) {
    	
    	ModelAndView mav = new ModelAndView();
    	
    	Object obj = session.getAttribute("member_dto");
	    MemberDTO mDto = (MemberDTO) obj;
	    
	    String p_id = mDto.getP_id();
    	mav.addObject("p_id", p_id);
    	//System.out.println(p_id);
    	
    	//p_id=?인 order_prodetail 목록 가져오기
	    //ProorderDTO prolist = dao.proorderlist(p_id);
    	List<ProorderDTO> prolist = dao.proorderlist(p_id);
	    mav.addObject("prolist", prolist);
	    
	    //System.out.println(prolist);
	    
	    //p_id=?인 order_perdetail 목록 가져오기
    	//PerorderDTO perlist = dao.perorderlist(p_id);
	    List<PerorderDTO> perlist = dao.perorderlist(p_id);
    	mav.addObject("perlist", perlist);
	    
    	mav.setViewName("order/myorderlist");
    	
    	return mav;
    }//myorderlist() end
	
}//class end
