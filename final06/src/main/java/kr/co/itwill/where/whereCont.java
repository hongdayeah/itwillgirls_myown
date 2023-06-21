package kr.co.itwill.where;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/where")
public class whereCont {

	@RequestMapping("/facility.do")
	public String facility() {
		return "where/facility";
	}//facility() end
	
	@RequestMapping("/company.do")
	public String company() {
		return "where/company";
	}//company() end
}
 