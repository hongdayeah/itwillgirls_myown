package kr.co.itwill.notice;

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
@RequestMapping("/notice")
public class NoticeCont {

	@Autowired
	private NoticeDAO dao;
	
	public NoticeCont() {
		System.out.println("-----NoticeCont() 객체 생성됨");
	}//end
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeList"); 
		
		mav.addObject("list", dao.list());
		
		return mav;
	}//list() end
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public ModelAndView createForm(String not_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/createForm");
		mav.addObject("not_no", not_no);
		return mav;
	}//createForm() end


	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public ModelAndView craeteProc(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/msgView");
		
		ServletContext application=req.getServletContext();
		String basePath=application.getRealPath("/noticeimg");
		 
		MultipartFile not_imgMF=dto.getNot_imgMF();
		String not_img=UploadSaveManager.saveFileSpring30(not_imgMF, basePath);
		dto.setNot_img(not_img);
		dto.setNot_size(not_imgMF.getSize());
		
		//////////////////////
		int cnt=dao.create(dto); 
		if(cnt==0) {
			String msg1="<p>공지 등록실패</p>";
			String link1="<input type='button' value='다시시도'' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='목록으로' onclick='#'>";
	        mav.addObject("msg1", msg1);
	        mav.addObject("link1", link1); 
	        mav.addObject("link2", link2); 
		} else {
			 String msg1="<p>공지 등록완료</p>";
			 mav.addObject("msg1", msg1);
			 String link1="<input type='button' value='목록으로' onclick='#'>";
			 mav.addObject("link1", link1); 
			}//if end
		return mav; 
		}//createProc() end
	

	@RequestMapping("/read.do")
	public ModelAndView read(String not_no) {
		ModelAndView mav=new ModelAndView();
		NoticeDTO dto=dao.read(not_no);
		mav.setViewName("notice/noticeRead");
		
		mav.addObject("dto", dto);
		return mav;
	}//read() end


	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteForm(String not_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/deleteForm");
		mav.addObject("not_no", not_no);
		return mav;
	}//deleteForm() end
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public ModelAndView deleteProc(String not_no, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/msgView");
		
		//삭제하고자 하는 글 정보 가져오기(/noticeimg 폴더에서 삭제할 파일명 확인하기 위해)
		NoticeDTO oldDTO=dao.read(not_no);
		
		int cnt=dao.delete(not_no);
		if(cnt==0) {
			String msg1="<p>공지 삭제실패</p>";
			String link1="<input type='button' value='다시시도'' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?not_no=" + oldDTO.getNot_no() + "\"'>";
	        mav.addObject("msg1", msg1);
	        mav.addObject("link1", link1); 
	        mav.addObject("link2", link2); 
		} else {
			 String msg1="<p>공지 삭제완료</p>";
			 mav.addObject("msg1", msg1);
			 String link1="<input type='button' value='목록으로' onclick='location.href=\"list.do?not_no=" + oldDTO.getNot_no() + "\"'>";
			 mav.addObject("msg1", msg1);
			 mav.addObject("link2", link1);  
			 
			 //첨부했던 파일 삭제
			 ServletContext application=req.getServletContext();
			 String basePath=application.getRealPath("noticeimg");
			 UploadSaveManager.deleteFile(basePath, oldDTO.getNot_img());
		}
		return mav;
	}//deletePROC() end
	
	
}

