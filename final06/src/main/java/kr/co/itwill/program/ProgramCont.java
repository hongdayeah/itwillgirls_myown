package kr.co.itwill.program;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.like.LikeDTO;
import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.protime.ProtimeDTO;
import net.utility.UploadSaveManager;

@Controller
public class ProgramCont {
	
	@Autowired
	private ProgramDAO dao;
	
	public ProgramCont() {
		System.out.println("-----ProgramCont()객체 생성됨");
	}
	
	//목록
	@RequestMapping("/program/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/list");
		List<ProgramDTO> list = dao.list();
		mav.addObject("list", list);
		
		return mav;
	}//list() end
	
	//프로그램 등록
	@RequestMapping(value="/program/create.do", method=RequestMethod.GET)
	public ModelAndView createForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/createForm");
		
		return mav;
	}//createForm() end
	
	@RequestMapping(value="/program/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute ProgramDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/msgView");
		
		MultipartFile pro_posterMF = dto.getPro_posterMF();
		System.out.println(pro_posterMF);
		MultipartFile pro_imgMF = dto.getPro_imgMF();
		String pro_poster = pro_posterMF.getOriginalFilename();
		String pro_img = pro_imgMF.getOriginalFilename();
		dto.setPro_poster(pro_poster);
		dto.setPro_img(pro_img);
		
		int cnt = dao.create(dto);
		
		if(cnt==0) {
			mav.setViewName("program/msgView");
			String msg1 = "<p>프로그램 등록 실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>"; //수정
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		}else {
			String msg1 = "<p>프로그램 등록 성공</p>";
			mav.addObject("msg1", msg1);
			String link1 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			mav.addObject("link1",link1);
		}//if end
		
		return mav;
	}//createProc() end
	
	//상세보기
	@RequestMapping("/program/read.do")
	public ModelAndView read(String pro_obj, @RequestParam(value = "p_id", required = false) String p_id, HttpSession session) {
		//@RequestParam(value = "p_id", required = false) String p_id : p_id 값이 null이어도 상관 없음
		ModelAndView mav = new ModelAndView();
		ProgramDTO dto = dao.read(pro_obj);
		mav.setViewName("program/read");
		
		mav.addObject("dto", dto);
		
		//////////////ProramDAO에 선언한 ptread()함수 추가 (program_time에서 pro_obj=?인 행 조회)
		List<ProtimeDTO> ptlist = dao.ptlist(pro_obj);
		mav.addObject("ptlist", ptlist);
		
		//////////////조회수 증가하는 함수
		dao.incrementCnt(pro_obj);
		
		//////////////로그인 한 p_id 가져오기 
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		//System.out.println(p_id);
		//System.out.println(memdto);
		
		//////////////p_id가 null값(로그아웃)이어도 read페이지 볼 수 있게하기 
		if (memdto != null) {
	        p_id = memdto.getP_id();
	    } else {
	        // 로그인하지 않은 경우에 대한 처리 (p_id를 원하는 값으로 설정)
	        p_id = "guest";
	    }
		//System.out.println(p_id);
		//////////////ProgramDAO에 선언한 likeread()함수 추가(like_program에서 pro_obj=? and p_id=?인 행 조회해서 개수 반환)
		int likedto = dao.likeread(pro_obj, p_id);
		mav.addObject("likedto", likedto);
		//System.out.println(likedto);
		
		
		//ProgramDAO에 선언한 pro_obj=?의 likecnt()함수 추가 (해당 pro_obj의 찜 개수)
		int likecnt = dao.likecnt(pro_obj);
		mav.addObject("likecnt", likecnt);
		return mav;
	}//read() end
	
	//수정
	@RequestMapping(value="/program/update.do", method=RequestMethod.GET)
	public ModelAndView update(String pro_obj) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("program/updateForm");
		ProgramDTO dto = dao.read(pro_obj);
		mav.addObject("dto", dto);
		
		return mav;
	}//update() end
	
	@RequestMapping(value="/program/update.do", method=RequestMethod.POST)
	public ModelAndView updateProc(@ModelAttribute ProgramDTO dto, HttpServletRequest req) {
		MultipartFile pro_posterMF = dto.getPro_posterMF();
		MultipartFile pro_imgMF = dto.getPro_imgMF();
		
		String pro_poster = pro_posterMF.getOriginalFilename();
		String pro_img = pro_imgMF.getOriginalFilename();
		
		dto.setPro_poster(pro_poster);
		dto.setPro_img(pro_img);
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = dao.update(dto);
		
		if(cnt==0) {
			mav.setViewName("program/msgView");
			String msg1 = "<p>수정실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"list.do\"'>";
			
			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		}else {
			mav.setViewName("redirect:/program/list.do");
		}//if end
		
		return mav;
	}//updateProc() end
	
}//class end
