package kr.co.itwill.teacher;

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
public class TeacherCont {
	
	@Autowired
	private TeacherDAO dao;
	
	public TeacherCont() {
		System.out.println("-----TeacherCont() 객체 생성됨");
	}
	
	//목록
	@RequestMapping("/teacher/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacher/list");
		List<TeacherDTO> list = dao.list();
		mav.addObject("list", list);
		
		return mav;
	}//list() end
	
	
	//강사 등록
	@RequestMapping(value="/teacher/create.do", method=RequestMethod.GET)
	public ModelAndView createForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacher/createForm");
		
		return mav;
	}//createForm() end
	
	@RequestMapping(value="/teacher/create.do", method = RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute TeacherDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacher/msgView");
		
		//파일처리
		//tstorage에 저장
		
		//파일 저장 폴더의 실제 물리적인 경로 가져오기
		//ServletContext application = req.getServletContext();
		//String basePath = "https://myabcdebucket.s3.ap-northeast-2.amazonaws.com";
		//System.out.println(basePath);
		//1) <input type="file" name="t_photoMF">
		MultipartFile t_photoMF = dto.getT_photoMF(); //파일 가져오기
		//String t_photo = UploadSaveManager.saveFileSpring30(t_photoMF, basePath);
		String t_photo = t_photoMF.getOriginalFilename();
		dto.setT_photo(t_photo);
	
		int cnt = dao.create(dto);
		
		if(cnt==0) {
			mav.setViewName("teacher/msgView");
			String msg1 = "<p>강사 등록 실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>"; //수정
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		}else {
			String msg1 = "<p>강사 등록 성공</p>";
			mav.addObject("msg1", msg1);
			String link1 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			mav.addObject("link1",link1);
		}//if end
		
		return mav;
	}//createProc() end
	
	//상세보기
	@RequestMapping("/teacher/read.do")
	public ModelAndView read(String t_code) {
		ModelAndView mav = new ModelAndView();
		TeacherDTO dto = dao.read(t_code);
		mav.setViewName("teacher/read");
		
		mav.addObject("dto",dto);
		
		return mav;
	}//read() end
	
	//수정
	@RequestMapping(value="/teacher/update.do", method=RequestMethod.GET)
	public ModelAndView update(String t_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacher/updateForm");
		TeacherDTO dto = dao.read(t_code);
		mav.addObject("dto", dto);
	
		return mav;
	}//update() end
	
	@RequestMapping(value="/teacher/update.do", method=RequestMethod.POST)
	public ModelAndView updateProc(@ModelAttribute TeacherDTO dto, HttpServletRequest req) {
		//TeacherDTO oldDTO = dao.read(dto.getT_code());
		
		//ServletContext application = req.getServletContext();
		//String basePath = application.getRealPath("/tstorage");
		
		MultipartFile t_photoMF = dto.getT_photoMF(); //파일 가져오기
		//String t_photo = UploadSaveManager.saveFileSpring30(t_photoMF, basePath);
		String t_photo = t_photoMF.getOriginalFilename();
		dto.setT_photo(t_photo);
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.update(dto);
		
		if(cnt==0) {
			mav.setViewName("teacher/msgView");
			String msg1 = "<p>수정실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		}else {
			mav.setViewName("redirect:/teacher/list.do");
		}//if end
		
		return mav;
	}//updateProc() end
	
	///////////////////////////////////삭제 확인해야함
	@RequestMapping(value="/teacher/delete.do", method=RequestMethod.GET)
	public ModelAndView delete(String t_code) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("t_code", t_code);
	
		return mav;
	}//delete() end
	
	@RequestMapping(value="teacher/delete.do", method=RequestMethod.POST)
	public ModelAndView deleteProc(String t_code) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacher/msgView");
		mav.addObject("t_code", t_code);
		
		int cnt = dao.delete(t_code);
		
		if(cnt==0) {
			String msg1 = "<p>강사 삭제 실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		}else {
			String msg1="<p>강사 삭제 성공</p>";
			String link1="<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
		
			mav.addObject("msg1", msg1);
			mav.addObject("link2", link1);
		}//if end
		
		return mav; 
	}//deleteProc() end
	
}//class end
