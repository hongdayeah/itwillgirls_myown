package kr.co.itwill.member.kid;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;

@Controller
@RequestMapping("/member_kid")
public class MemberKidCont {

	public MemberKidCont() {
		System.out.println("-----MemberKidCont() 객체 생성됨");
	}// end

	@Autowired
	private KidDAO dao;

	// 자녀 회원 목록 보여주기
	@RequestMapping("/kidList.do")
	public ModelAndView kidList(HttpSession session, Integer k_no) {
		// public ModelAndView kidList(String p_id) {

		// 로그인 성공 했을 때 로그인 정보는 세션에 올려진 상태
		Object obj = session.getAttribute("member_dto");
		MemberDTO mDto = (MemberDTO) obj;

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/kidList");
		mav.addObject("list", dao.list(mDto.getP_id()));
		// mav.addObject("p_id", p_id); // 부모아이디 넘기기 -> 세션값은 넘기지 않아도 됨
		mav.addObject("k_no", k_no);
		return mav;
	}// list() end

	// 자녀 회원 추가하기
	@RequestMapping(value = "/addKid.do", method = RequestMethod.GET)
	public ModelAndView createForm(String p_id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/kidAddForm");
		mav.addObject("p_id", p_id); // 부모글번호
		return mav;
	}// createForm() end

	// 자녀 회원 추가하기
	@RequestMapping(value = "/addKid.do", method = RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute MemberKidDTO kid_dto, HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/kidList");

		int cnt = dao.create(kid_dto);
		if (cnt == 0) { // 행추가 실패

			String msg1 = "<p>자녀 회원 등록 실패</p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"kidList.do\"'>";

			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);

		} else { // 행추가 성공하면 목록페이지로 이동
			mav.setViewName("redirect:/member_kid/kidList.do");
		} // if end

		return mav;
	}// createProc() end

	// 자녀 회원 수정하기
	@RequestMapping(value = "/kidModify.do", method = RequestMethod.GET)
	public ModelAndView kidModify(int k_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/kidModifyForm");
		MemberKidDTO dto = dao.read(k_no);
		mav.addObject("k_no", k_no);
		mav.addObject("dto", dto);
		return mav;
	}// update() end

	// 자녀 회원 수정하기
	@RequestMapping(value = "/kidModify.do", method = RequestMethod.POST)
	public ModelAndView kidModify(int k_no, @ModelAttribute MemberKidDTO dto) {

		ModelAndView mav = new ModelAndView();
		int cnt = dao.update(dto);
		if (cnt == 0) {
			mav.setViewName("member_kid/msgView");
			String msg1 = "<p> 수정실패 </p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"kidList.do\"'>";

			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);
		} else {
			mav.setViewName("redirect:/member_kid/kidList.do");
		} // if end
		return mav;
	}// updateProc() end

	// 자녀 회원 삭제
	@RequestMapping(value = "/kidDelete.do", method = RequestMethod.GET)
	public ModelAndView deleteForm(int k_no) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/kidDeleteForm");
		//아래 3줄 추가
		MemberKidDTO dto = dao.read(k_no);
		mav.addObject("k_no", k_no);
		mav.addObject("dto", dto);
		
		return mav;
	} // deleteForm() end

	@RequestMapping(value = "/kidDelete.do", method = RequestMethod.POST)
	public ModelAndView deleteProc(int k_no) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member_kid/msgView");

		int cnt = dao.delete(k_no);
		if (cnt == 0) {
			String msg1 = "<p> 자녀 회원 삭제 실패 </p>";
			String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()' >";
			String link2 = "<input type='button' value='목록으로' onclick='location.href=\"kidList.do\"'>";

			mav.addObject("msg1", msg1);
			mav.addObject("link1", link1);
			mav.addObject("link2", link2);

		} else {
			mav.setViewName("redirect:/member_kid/kidList.do");
		} // if end

		return mav;

	} // deleteProc() end

}// class end
