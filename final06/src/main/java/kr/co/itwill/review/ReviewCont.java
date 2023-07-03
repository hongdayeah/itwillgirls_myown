package kr.co.itwill.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itwill.member.MemberDTO;

@Controller
public class ReviewCont {

	@Autowired
	private reviewDAO dao;
	
	private ReviewCont() {
		System.out.println("-----ReivewCont()객체 생성됨");
	}
	
	//등록
	@RequestMapping("/program/reviewcreate.do")
	@ResponseBody
	public int reviewInsert(@RequestParam("rev_obj") String pro_obj,
							   @RequestParam("rev_con") String rev_con,
							   @RequestParam("p_passwd") String p_passwd,
							   HttpSession session,
							   @ModelAttribute ReviewDTO dto) {
		
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO) obj;
		String p_id = memdto.getP_id();
		
		//System.out.println(pro_obj);
		//System.out.println(p_id);
		//System.out.println(rev_con);
		//System.out.println(p_passwd);
		
	    int message=-1;		
		
		//후기 등록하는 사람이 예매내역의 pro_obj를 수강한 사람이 맞는지 확인
		boolean objcnt = dao.readobj(p_id, pro_obj);
		if(objcnt==true) {
			//예매내역에 있는 p_id가 해당 pro_obj를 수강했다면 후기를 쓸 수 있다.
			int cnt = dao.create(pro_obj, p_id, rev_con, p_passwd);
			if(cnt==0) {
				//message="후기 작성 실패";
				message=0;
			}else {
				//message="후기가 등록되었습니다.";
				message=1;
			}
		}else {
			//없으면 쓸 수 없다.
			//message="후기는 해당 프로그램을 수강한 사람만 작성할 수 있습니다.";
			message=-1;
		}
		return message;
	}//reviewInsert() end
}//class end
