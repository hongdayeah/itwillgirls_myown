package kr.co.itwill.testresult;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.member.kid.MemberKidDTO;
import kr.co.itwill.program.ProgramDTO;
import kr.co.itwill.typeinfo.TypeinfoDTO;

@Controller
public class TestresultCont {
	
	@Autowired
	private TestresultDAO dao;
	
	public TestresultCont() {
		System.out.println("-----TestresultCont()객체 생성됨");
	}
	
	//테스트 시작 화면이자 자녀의 이름을 입력받는 화면
	@RequestMapping(value="/test/main.do", method=RequestMethod.GET)
	public ModelAndView main(@RequestParam(value = "p_id", required = false) String p_id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("test/main");
		
		//로그인 한 p_id 가져오기
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		
		//p_id가 null값(로그아웃)이어도 페이지 볼 수 있게 하기
		if(memdto != null) {
			p_id = memdto.getP_id();
		}else {
			p_id = "guest";
		}
		//System.out.println(p_id);
		
		//해당 아이디의 자녀 리스트 보여주기
		//TestresultDAO에 선언한 klist()함수 추가 (p_id=?인 행에 대해서만 조회)
		List<MemberKidDTO> klist = dao.klist(p_id);
		mav.addObject("klist", klist);
		//System.out.println(klist);
		return mav;
	}//main() end
	
	@RequestMapping(value="/test/create.do", method=RequestMethod.POST)
	public String createProc(@RequestParam("k_no") int k_no, @RequestParam(value = "p_id", required = false) String p_id, HttpSession session, Model model) {
		
		//로그인 한 p_id 가져오기
		Object obj = session.getAttribute("member_dto");
		MemberDTO memdto = (MemberDTO)obj;
		
		//p_id가 null값(로그아웃)이어도 페이지 볼 수 있게 하기
		if(memdto != null) {
			p_id = memdto.getP_id();
		}else {
			p_id = "guest";
		}
		//System.out.println(p_id);
		
		//TestresultDAO에 선언한 kread()함수 추가 (k_no=?인 행의 자녀이름 조회)
		String k_name = dao.kread(k_no);
		
		//p_id와 k_name값 입력
		int cnt = dao.create(p_id, k_name, k_no);
		
		//k_no값 뷰단으로 넘기기
		model.addAttribute("k_no", k_no);
		//System.out.println(k_no);
		
		if(cnt==0) {
			System.out.println("testreuslt 행 삽입 실패");
		}
		
		//자녀이름은 한글인데 디비에는 잘 들어가진다.
		//근데 url엔 한글이라서 ???로 깨지길래 utf-8로 url을 인코딩해주었다.
		//String enk_name = URLEncoder.encode(k_name, StandardCharsets.UTF_8);
		//String redirectUrl = "redirect:/test/sungtest.do?k_name=" + k_name;
		
		return "redirect:/test/sungtest.do?k_no="+k_no;
	}//createProc() end
	
	//테스트 1부의 값 저장(table update)
	@RequestMapping(value="/test/sresupdate.do", method=RequestMethod.POST)
	public String supdateProc(@RequestParam("k_no") int k_no, @RequestParam("sresult-0") int sresult0,
															  @RequestParam("sresult-1") int sresult1,
															  @RequestParam("sresult-2") int sresult2,
															  @RequestParam("sresult-3") int sresult3,
															  @RequestParam("sresult-4") int sresult4,
															  @RequestParam("sresult-5") int sresult5,
															  @RequestParam("sresult-6") int sresult6,
															  @RequestParam("sresult-7") int sresult7,
															  @RequestParam("sresult-8") int sresult8,
															  @RequestParam("sresult-9") int sresult9) {
		
		//System.out.println(k_no);
		//System.out.println(sresult0);
		
		int sum = 0; // radio버튼으로 선택한 value의 총 합을 저장할 변수
		String sresult = null; //sum의 값(숫자)에 따라 I | E 를 담을 변수
		
		sum = sresult0 + sresult1 + sresult2 + sresult3 + sresult4 + sresult5 + sresult6 + sresult7 + sresult8 + sresult9; 
	    //System.out.println(sum);
		
		if(sum>5) {
			sresult = "I"; //내성
		}else{
			sresult = "E"; //외성
		}
		int cnt = dao.sresupdate(k_no, sresult);
		
		if(cnt==0) {
			System.out.println("testresult 테이블에 sresult값 추가 실패");
		}
		return "redirect:/test/hyangtest.do?k_no="+k_no;
	}//supdateProc() end
	
	//테스트 2부의 값 저장(table update, 자녀테이블에 typename도 update)
	@RequestMapping(value="/test/hresupdate.do", method=RequestMethod.POST)
	public String hupdateProc(@RequestParam("k_no") int k_no, @RequestParam("hresult-0") int hresult0,
															  @RequestParam("hresult-1") int hresult1,
															  @RequestParam("hresult-2") int hresult2,
															  @RequestParam("hresult-3") int hresult3,
															  @RequestParam("hresult-4") int hresult4,
															  @RequestParam("hresult-5") int hresult5,
															  @RequestParam("hresult-6") int hresult6,
															  @RequestParam("hresult-7") int hresult7,
															  @RequestParam("hresult-8") int hresult8,
															  @RequestParam("hresult-9") int hresult9) {
		
		//System.out.println(k_no);
		//System.out.println(hresult0);
		
		int sum = 0; // radio버튼으로 선택한 value의 총 합을 저장할 변수
		String hresult = null; //sum의 값(숫자)에 따라 I | E 를 담을 변수
		
		sum = hresult0 + hresult1 + hresult2 + hresult3 + hresult4 + hresult5 + hresult6 + hresult7 + hresult8 + hresult9; 
	    //System.out.println(sum);
		
		if(sum>5) {
			hresult = "E"; //외향
		}else{
			hresult = "I"; //내향
		}
		int cnt = dao.hresupdate(k_no, hresult);
		
		if(cnt==0) {
			System.out.println("testresult 테이블에 hresult 값 추가 실패");
		}
		//System.out.println("h : " + hresult);
		
		//여기에 sresult 값 불러오기
		String sresult = dao.sread(k_no);
		//System.out.println("s : " + sresult);
		
		//sresult + hresult concat하여 typename에 update
		int rescnt = dao.shupdate(k_no, sresult, hresult);
		if(rescnt==0) {
			System.out.println("testresult 테이블에 sresult + hresult 값 추가 실패");
		}
		
		//해당 결과를 읽어와서 String typename에 저장하고 자녀정보 테이블의 typename에 업데이트
		String typename = dao.tread(k_no);
		
		int typecnt = dao.kidtypeupdate(k_no);
		if(typecnt==0) {
			System.out.println("member_kid에 typename 수정 실패 ");
		}
		
		return "redirect:/test/testresult.do?k_no="+k_no; //결과 보여주는 페이지 
	}//updateProc() end
	
	//테스트 결과 확인
	@RequestMapping("/test/testresult.do")
	public ModelAndView resultview(@RequestParam("k_no") int k_no) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test/testresult");
		
		//자녀 이름 가져오기
		//System.out.println(k_no);
		String k_name = dao.kread(k_no);
		mav.addObject("k_name", k_name);
		
		//해당 자녀의 테스트결과 가져오기
		String resulttype = dao.tread(k_no);
		mav.addObject("resulttype", resulttype);
		//해당 테스트 결과의 typename과 일치하는 행을 typeinfo테이블에서 가져오기
		TypeinfoDTO infodto = dao.inforead(resulttype);
		mav.addObject("infodto", infodto);
		//System.out.println("infodto : " + infodto);
		
		//program_info 테이블에서 결과와 매칭되는 프로그램 리스트 가져오기
		List<ProgramDTO> prolist = dao.prolist(resulttype);
		mav.addObject("prolist", prolist);
		//System.out.println("prolist : " + prolist);
		
		return mav;
	}//resultview() end
}//class end
