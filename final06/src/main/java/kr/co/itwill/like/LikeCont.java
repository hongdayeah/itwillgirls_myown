package kr.co.itwill.like;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.member.kid.MemberKidDTO;
import kr.co.itwill.program.ProgramDTO;

@Controller
public class LikeCont {

	@Autowired
	private LikeDAO dao;
	
	public LikeCont() {
		System.out.println("-----LikeCont()객체 생성됨");
	}
	
	
	//관심프로그램 등록(찜 insert)
	@RequestMapping("program/likeInsert.do")
	@ResponseBody //성공하면 본문의 ajax -> success로 이동 ??
	public String likeInsert(@RequestParam("pro_obj") String pro_obj, @RequestParam("p_id") String p_id, @ModelAttribute LikeDTO likedto) {
		//ajax에서 success하면 alert()로 반환하기로 했으니까 리턴 값은 string이 되어야한다.
		//modelandview 방식의 함수는 새로운 페이지로 변환하도록 하는것이기 때문에 modelandview 함수가 아니어도 됨.
		
		//System.out.println(pro_obj);
		//System.out.println(p_id);
		//System.out.println(likedto);
		
		//ajax에서 pro_obj로 받은 것을 여기서 String pro_obj, p_id로 받은 것을 여기서 String p_id로 쓰겠다
		
		//ModelAndView mav = new ModelAndView();
		//mav.addAttribute("pro_obj", pro_obj);
		//mav.
		//LikeDAO에 선언한 memread()함수 추가
		//MemberDTO memdto = dao.memread(p_id);
		
		//LikeDAO에 선언한 proread()함수 추가
		//ProgramDTO prodto = dao.proread(pro_obj);
		
		
		//찜 추가
		int cnt = dao.create(likedto);
		
		if(cnt==0) {
			return "관심프로그램 등록 실패!!";
		}else {
			return "관심프로그램으로 등록되었습니다.\n마이페이지로 이동합니다.";
		}//if end		
	}//likeInsert() end
	
	
	//관심프로그램 취소(찜 delete)
	@RequestMapping("program/likeDelete.do")
	@ResponseBody
	public String likeDelete(@RequestParam("pro_obj") String pro_obj, @RequestParam("p_id") String p_id, @ModelAttribute LikeDTO likedto) {
		
		//System.out.println(pro_obj);
		//System.out.println(p_id);
		//찜 삭제
		int cnt = dao.delete(pro_obj, p_id);
		
		if(cnt==0) {
			return "관심프로그램 취소 실패!!";
		}else {
			return "취소되었습니다.";
		}
	}//likeDelete() end
	
	// 내가 찜한 목록 보여주기
	@RequestMapping("/program/myLikeList.do")
	public ModelAndView kidList(HttpSession session, Integer like_no) {

		// 로그인 성공 했을 때 로그인 정보는 세션에 올려진 상태
		Object obj = session.getAttribute("member_dto");
		MemberDTO mDto = (MemberDTO) obj;

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/myLikeList");
		mav.addObject("list", dao.list(mDto.getP_id()));
		mav.addObject("like_no", like_no);
		return mav;
	}// list() end
	
	// 여기서 부터 추가했습니다~
	// 찜 추가하기
	/*
	//@RequestMapping(value = "/program/likeInsert.do", method = RequestMethod.POST)
	@RequestMapping("/program/likeInsert.do")
	public ModelAndView createProc(@ModelAttribute LikeDTO like_dto) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/myLikeList");

		int cnt = dao.create(like_dto);
		if (cnt == 0) { // 찜 추가 실패

			String msg1 = "<p>찜 추가 실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"/program/list.do\"'>"; // 경로 수정 필요

			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);

		} else { // 찜 추가 성공하면 마이페이지 나의 찜 목록 페이지로 이동
			mav.setViewName("redirect:/program/myLikeList.do");
		} // if end

		return mav;
	}// createProc() end	
	*/
}//class end
