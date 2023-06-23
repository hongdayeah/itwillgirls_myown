package kr.co.itwill.member.kid;

import java.util.List;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itwill.service.MemberService;

@Controller
@RequestMapping("/member_kid")
public class MemberKidCont {

	public MemberKidCont() {
		System.out.println("-----MemberKidCont() 객체 생성됨");
	}// end
	
	@Autowired
	MemberService memberservice; // 부모와 자녀 모두 MemberService에서 진행

	// 자녀 회원 등록 페이지 이동
	@RequestMapping("/addKid.do")
	public String addKid() {
		return "member_kid/kidAddForm";
	}// addKid() end
	
	// 자녀 회원 등록
	@RequestMapping(value = "/addKid.do", method = RequestMethod.POST)
	public String addKid(MemberKidDTO kid_dto) throws Exception {

		// 자녀 회원 등록 실행
		memberservice.addKid(kid_dto);
		
		return "redirect:/home.do";
	}// joinPOST() end
	
	// 자녀 회원 목록 보여주기(본인 자녀만) - 리스트를 먼저 보여주고 등록 버튼을 만들어보자!
	/*
	@RequestMapping("/kidList.do")
	public String kidList() {
		return "member_kid/kidList";
	}// kidList() end
	*/
	//@RequestMapping(value = "/kidList.do", method = RequestMethod.POST)
	@RequestMapping("/kidList.do")
	public String kidList(Model model) throws Exception {

		List<MemberKidDTO> kidList = memberservice.kidList();
		
		//어떠한 html로 가져갈 데이터가 있다면 model 사용
		model.addAttribute("kidList", kidList);
		return "member_kid/kidList";
	}// joinPOST() end

}// class end
