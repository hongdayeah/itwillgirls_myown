package kr.co.itwill.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageCont {

	public MypageCont() {
		System.out.println("-----MypageCont() 객체 생성됨");
	}//end
	
	@RequestMapping("/myList.do")
	public String list() {
		return "mypage/mylist";
	}//list() end
	
}//class end
