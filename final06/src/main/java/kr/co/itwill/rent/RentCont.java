package kr.co.itwill.rent;
  
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rent")
public class RentCont {
	
	public RentCont() {
		System.out.println("-----RentCont() 객체 생성됨");
	}//end
	   
	@Autowired
	private RentDAO dao;
	
	
	@RequestMapping("/insert")
	public String insert() {
		return "rent/rentForm";
	}
	
	  
}
	