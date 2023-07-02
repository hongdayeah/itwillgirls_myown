package kr.co.itwill.proorder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ProorderCont {

	@Autowired
	private ProorderDAO dao;
	
	public ProorderCont() {
		System.out.println("-----ProorderCont()객체 생성됨");
	}
	
	
}//class end
