package kr.co.itwill.performance;

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
public class PerformanceCont {
	
	@Autowired
	private PerformanceDAO dao;
	
	public PerformanceCont() {
		System.out.println("-----Performance() 객체 생성됨");
	} //end
	
	@RequestMapping("/performance/list.do")
	public ModelAndView list(String per_code) {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("performance/list");
		mav.addObject("list", dao.list(per_code));

		return mav;
	}//list() end
	
	
	@RequestMapping(value = "/performance/create.do", method = RequestMethod.GET)
    public ModelAndView createForm(String per_code) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("performance/createForm");
        mav.addObject("per_code", per_code);
        return mav;
    }//createForm() end
	
	
	@RequestMapping(value = "/performance/create.do", method = RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute PerformanceDTO dto,HttpServletRequest req) {
	
		ModelAndView mav=new ModelAndView();
		mav.setViewName("performance/msgView");
		
		///////////////////////////////////////////////////////////
		//첨부된 파일 처리
		//->실제 파일은 /perstorage폴더에 저장
		//->저장된 파일 관련 정보는 performance테이블에 저장
		
		//파일 저장 폴더의 실제 물리적인 경로 가져오기
		ServletContext application=req.getServletContext();
		String basePath=application.getRealPath("../perstorage");
		
		//1)<input type='file' name='per_imgMF'>
				MultipartFile per_imgMF=dto.getPer_imgMF(); //파일 가져오기
				// /perstorage폴더에 파일 저장하고, 리네임된 파일명 반환
				String per_img=UploadSaveManager.saveFileSpring30(per_imgMF, basePath);
				dto.setPer_img(per_img); //리네임된 파일명을 dto 객체 담기
				dto.setPer_size(per_imgMF.getSize());
			
		///////////////////////////////////////////////////////////		
				
	int cnt=dao.create(dto);
	if(cnt==0) {
		 String msg1="<p>공연 등록 실패</p>";
		 String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
         String link2="<input type='button' value='목록으로' onclick='#'>";
         mav.addObject("msg1", msg1);
         mav.addObject("link1", link1); 
         mav.addObject("link2", link2); 
	} else {
		 String msg1="<p>공연 등록 성공</p>";
		 mav.addObject("msg1", msg1);
		 String link1="<input type='button' value='목록으로' onclick='#'>";
		 mav.addObject("link1", link1); 
		}//if end
	
	return mav;
	
	}//createProc() end

}
