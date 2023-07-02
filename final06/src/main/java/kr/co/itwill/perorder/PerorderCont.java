package kr.co.itwill.perorder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PerorderCont {

	@Autowired
	private PerorderDAO dao;
	
	public PerorderCont() {
		System.out.println("-----PerorderCont()객체 생성됨");
	}
	
}//class end
