package kr.co.itwill.performance;

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

import kr.co.itwill.classroom.ClassroomDTO;
import kr.co.iwill.performanceSeat.PerformanceSeatDAO;
import kr.co.iwill.performanceSeat.PerformanceSeatDTO;
import net.utility.UploadSaveManager;

@Controller
public class PerformanceCont {
	
	@Autowired
	private PerformanceDAO dao;
	

	
	public PerformanceCont() {
		System.out.println("-----Performance() 객체 생성됨");
	} //end
	

	@RequestMapping("/performance/seat.do")
	public ModelAndView seat(String per_code) {
	
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/performanceSeat/seat");
		
		PerformanceDTO dto=dao.read(per_code);
		mav.addObject("dto",dto);
		

		//performance DAO에 선언한 seatInfo() 함수 추가
		ClassroomDTO seatInfo = dao.seatInfo();
		mav.addObject("perSeatdto", seatInfo); 

		return mav;
		
	}
	

	
	@RequestMapping("/performance/list.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("performance/list");
	
		mav.addObject("list", dao.list());

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
		String basePath=application.getRealPath("/perstorage");
		
		//1)<input type='file' name='per_imgMF'>
				MultipartFile per_imgMF=dto.getPer_imgMF(); //파일 가져오기
				// /perstorage폴더에 파일 저장하고, 리네임된 파일명 반환
				String per_img=UploadSaveManager.saveFileSpring30(per_imgMF, basePath);
				dto.setPer_img(per_img); //리네임된 파일명을 dto 객체 담기
				dto.setPer_size(per_imgMF.getSize());
				
		//2)<input tyle='file' name='per_imgMFD'>
				MultipartFile per_imgMFD=dto.getPer_imgMFD();
				String per_img2=UploadSaveManager.saveFileSpring30(per_imgMFD, basePath);
				dto.setPer_img2(per_img2);
				dto.setPer_size2(per_imgMF.getSize());
			
		///////////////////////////////////////////////////////////		
				
		int cnt=dao.create(dto);
		if(cnt==0) {
			 String msg1="<p>공연 등록 실패</p>";
			 String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
	         String link2="<input type='button' value='목록으로' onclick='location.href='list.do'>";
	         mav.addObject("msg1", msg1);
	         mav.addObject("link1", link1); 
	         mav.addObject("link2", link2); 
		} else {
			 String msg1="<p>공연 등록 성공</p>";
			 mav.addObject("msg1", msg1);
			 String link1="<input type='button' value='목록으로' onclick='location.href='list.do'>";
			 mav.addObject("link1", link1); 
			}//if end
		
		return mav;
	
	}//createProc() end
	
	@RequestMapping("/performance/read.do")
	public ModelAndView read(String per_code){
		ModelAndView mav=new ModelAndView();
		PerformanceDTO dto=dao.read(per_code);
		mav.setViewName("performance/read");
		
		mav.addObject("dto", dto);
		return mav;
	} //read() end

	@RequestMapping(value="/performance/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteForm(String per_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("performance/deleteForm");
		mav.addObject("per_code", per_code);
		return mav;
	} //deleteForm() end
	
	@RequestMapping(value="/performance/delete.do", method=RequestMethod.POST)
	public ModelAndView deleteProc(String per_code, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("performance/msgView");
		
		// 삭제하고자 하는 글 정보 가져오기(/perstrage 폴더에서 삭제 할 파일명 확인하기 위해)
		PerformanceDTO oldDTO=dao.read(per_code);
		
		int cnt=dao.delete(per_code);
		if(cnt==0) {
			String msg1="<p> 공연 삭제 실패 </p>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()' >";
			String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?per_code=" + oldDTO.getPer_code() + "\"'>";
		
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		
		} else {
			String msg1="<p> 공연 삭제 성공 </p>";
			String link1="<input type='button' value='목록으로' onclick='location.href=\"list.do?per_code=" + oldDTO.getPer_code() + "\"'>";
		
			mav.addObject("msg1", msg1);
			mav.addObject("link2", link1);
			
			//첨부했던 파일 삭제
			ServletContext application=req.getServletContext();
			String basePath=application.getRealPath("perstorage");
			UploadSaveManager.deleteFile(basePath, oldDTO.getPer_img());
		
		} //if end
		
		return mav;
		
	} //deleteProc() end
	
	
	@RequestMapping(value="/performance/update.do", method=RequestMethod.GET)
	public ModelAndView updateForm(String per_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("performance/UpdateForm");
		PerformanceDTO dto=dao.read(per_code);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping(value="/performance/update.do", method=RequestMethod.POST)
	public ModelAndView updateProc(@ModelAttribute PerformanceDTO dto, HttpServletRequest req){
		
		PerformanceDTO oldDTO=dao.read(dto.getPer_code());
		
		ServletContext application=req.getServletContext();
		String basePath=application.getRealPath("/perstorage");
		
		//1)
		MultipartFile per_imgMF=dto.getPer_imgMF();
		if(per_imgMF.getSize()>0) {
			UploadSaveManager.deleteFile(basePath, oldDTO.getPer_img());
			String per_img=UploadSaveManager.saveFileSpring30(per_imgMF, basePath);
			dto.setPer_img(per_img); 
			dto.setPer_size(per_imgMF.getSize());
		} else {
			dto.setPer_img(oldDTO.getPer_img());
			dto.setPer_size(oldDTO.getPer_size());
		} //if end
		
		//2)
		MultipartFile per_imgMFD=dto.getPer_imgMFD();
		if(per_imgMFD.getSize()>0) {
			UploadSaveManager.deleteFile(basePath, oldDTO.getPer_img2());
			String per_img2=UploadSaveManager.saveFileSpring30(per_imgMFD, basePath);
			dto.setPer_img2(per_img2);
			dto.setPer_size2(per_imgMFD.getSize());
		} else {
			dto.setPer_img2(oldDTO.getPer_img2());
			dto.setPer_size2(oldDTO.getPer_size2());
		} //if end
		
		ModelAndView mav=new ModelAndView();
		int cnt=dao.update(dto);
		if(cnt==0) {
			mav.setViewName("performance/msgView");
			String msg1="<p> 수정실패 </p>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?per_code=" + oldDTO.getPer_code() + "\"'>";
		
            mav.addObject("msg1", msg1);
            mav.addObject("link1", link1); 
            mav.addObject("link2", link2);
		}else {
			
			mav.setViewName("redirect:/performance/list.do?per_code="+oldDTO.getPer_code());
				
		} //if end
		
		return mav;
		
	} //updateProc() end
	
	
	
}
