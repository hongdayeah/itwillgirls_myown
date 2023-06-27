package kr.co.itwill.qna;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna")
public class QnaCont {
	
	@Autowired
	private QnaDAO dao;
	
	public QnaCont() {
		System.out.println("-----QnaCont() 객체생성됨");
	}//end
	
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/qnaList");
		
		mav.addObject("list", dao.list());
		
		return mav;
	}//list() end
	
	@RequestMapping(value="/create.do", method=RequestMethod.GET)
	public ModelAndView createForm(Integer q_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/qnaForm");
		mav.addObject("q_no", q_no);
		return mav;
	}//createForm() end
	
	
	@RequestMapping(value="/create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute QnaDTO dto, HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/msgView");
		
		int cnt=dao.create(dto); 
		if(cnt==0) {
			String msg1="<p>문의 등록실패</p>";
			String link1="<input type='button' value='다시시도'' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='목록으로' onclick='#'>";
	        mav.addObject("msg1", msg1);
	        mav.addObject("link1", link1); 
	        mav.addObject("link2", link2); 
		} else {
			 String msg1="<p>문의 등록완료</p>";
			 mav.addObject("msg1", msg1);
			 String link1="<input type='button' value='목록으로' onclick='#'>";
			 mav.addObject("link1", link1); 
			}//if end
		return mav; 
		}//createProc() end	
	
	@RequestMapping("/read.do")
	public ModelAndView read(int q_no) {
		ModelAndView mav=new ModelAndView();
		QnaDTO dto=dao.read(q_no);
		mav.setViewName("qna/qnaRead");
		
		mav.addObject("dto", dto);
		return mav;
	}//read() end
	
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteForm(int q_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/deleteForm");
		mav.addObject("q_no", q_no);
		return mav;
	}//deleteForm() end
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public ModelAndView deleteProc(int q_no, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/msgView");
		
		QnaDTO oldDTO=dao.read(q_no);
		
		int cnt=dao.delete(q_no);
		if(cnt==0) {
			String msg1="<p>문의 삭제실패</p>";
			String link1="<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?q_no=" + oldDTO.getQ_no() + "\"'>";
			
	        mav.addObject("msg1", msg1);
	        mav.addObject("link1", link1); 
	        mav.addObject("link2", link2); 
		} else {
			 String msg1="<p>문의 삭제완료</p>";
			 mav.addObject("msg1", msg1);
			 String link1="<input type='button' value='목록으로' onclick='location.href=\"list.do?q_no=" + oldDTO.getQ_no() + "\"'>";
			 mav.addObject("link1", link1); 
			}//if end
		return mav;
	}//deleteProc() end
	
	
	@RequestMapping(value="/update.do", method=RequestMethod.GET)
	public ModelAndView updateForm(int q_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/updateForm");
		QnaDTO dto=dao.read(q_no);
		mav.addObject("q_no", q_no);
		mav.addObject("dto", dto);
		return mav;
	}//update() end
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView updateProc(int q_no, @ModelAttribute QnaDTO dto, HttpServletRequest req) {

			QnaDTO oldDTO=dao.read(dto.getQ_no());
			ModelAndView mav=new ModelAndView();
			int cnt=dao.update(dto); 
			if(cnt==0) {
				String msg1="<p>문의 수정실패</p>";
				String link1="<input type='button' value='다시시도'' onclick='javascript:history.back()'>";
				String link2="<input type='button' value='목록으로' onclick='location.href=\"list.do?q_no=" + oldDTO.getQ_no() + "\"'>";
		        mav.addObject("msg1", msg1);
		        mav.addObject("link1", link1); 
		        mav.addObject("link2", link2); 
			}else {
				mav.setViewName("redirect:/qna/list.do?q_no="+oldDTO.getQ_no());
			}//if end
			return mav;
		}//updateProc() end
	
	
	
	@RequestMapping(value="/reply.do", method=RequestMethod.GET)
	public ModelAndView replyForm(int q_no) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("qna/replyForm");
	    mav.addObject("q_no", q_no);
	    return mav;
	}//reply() end

	@RequestMapping(value="/reply.do", method=RequestMethod.POST)
	public ModelAndView replyProc(int q_no, @ModelAttribute QnaDTO dto, HttpServletRequest req) {
	    QnaDTO oldDTO = dao.read(dto.getQ_no());
	    System.out.println(oldDTO);
	    
	    ModelAndView mav = new ModelAndView();
	    int cnt = dao.reply(dto);
	    if (cnt == 0) {
	    	mav.setViewName("qna/msgView");
	        String msg1 = "<p>문의답글 등록실패</p>";
	        String link1 = "<input type='button' value='다시시도'' onclick='javascript:history.back()'>";
	        String link2 = "<input type='button' value='목록으로' onclick='location.href=\"list.do?q_no=" + q_no + "\"'>";
	        mav.addObject("msg1", msg1);
	        mav.addObject("link1", link1);
	        mav.addObject("link2", link2);
	    } else {
	    
	    mav.setViewName("redirect:/qna/list.do?q_no=" + oldDTO.getQ_no());
	    }
	    return mav;
	}//replyProc() end
}
