package kr.co.itwill.rent;
 
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.utility.UploadSaveManager;

@Controller
@RequestMapping("/rent")
public class RentCont {

	   
	@Autowired
	private RentDAO dao;
	

	public RentCont() {
		System.out.println("-----RentCont() 객체 생성됨");
	}//end

	 @RequestMapping("/list.do")
	 public ModelAndView list() {
		 ModelAndView mav=new ModelAndView();
		 mav.setViewName("rent/rentList");
		 
		 mav.addObject("list", dao.list());
		 
		 return mav;
	 }//list() end
	 
	 
	 
	 
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public ModelAndView rentForm(String rent_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("rent/rentForm");
		mav.addObject("rent_code", rent_code);
		return mav;
	}//rentForm() end
	
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute RentDTO dto, HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("rent/msgView");
	//////////////////////////////////////////////////////////	
	ServletContext application=req.getServletContext();
	String basePath=application.getRealPath("../rentFormimg");
	 
	MultipartFile rent_formMF=dto.getRent_formMF();
	String rent_form=UploadSaveManager.saveFileSpring30(rent_formMF, basePath);
	dto.setRent_form(rent_form);
	dto.setRent_size(rent_formMF.getSize());
		
	
/////////////////////////////////////////////////////////////	
	
	int cnt=dao.create(dto); 
	if(cnt==0) {
		String msg1="<p>신청서 제출실패</p>";
		String link1="<input type='button' value='다시시도'' onclick='javascript:history.back()'>";
		String link2="<input type='button' value='목록으로' onclick='#'>";
        mav.addObject("msg1", msg1);
        mav.addObject("link1", link1); 
        mav.addObject("link2", link2); 
	} else {
		 String msg1="<p>신청서 제출완료</p>";
		 mav.addObject("msg1", msg1);
		 String link1="<input type='button' value='목록으로' onclick='#'>";
		 mav.addObject("link1", link1); 
		}//if end
	return mav;
	}//createProc() end
	
	
	 @RequestMapping("/info.do")
	 public String info() {
		 return "rent/rentInfo";
	 }//info() end
	
	 
}
	