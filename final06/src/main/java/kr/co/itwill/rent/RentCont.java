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
	
	
	@RequestMapping("/create.do")
	public String create() { 
		return "rent/rentForm";
	}//form() end
	
	 @RequestMapping("/info.do")
	 public String info() {
		 return "rent/rentInfo";
	 }//info() end
	 
	 @RequestMapping("/rentProc")
	 public String rentProc() {
		 return "rent/rentProc";
	 }
	 
	 @RequestMapping("/list.do")
	 public String list() {
		 return "rent/rentList";
	 }
}
	