package kr.co.itwill.tendency;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TendencyCont {
	
	@Autowired
	private TendencyDAO dao;
	
	public TendencyCont() {
		System.out.println("-----TendencyCont()객체 생성됨");
	}
	
	//목록
	@RequestMapping("/tendency/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tendency/list");
		
		//목록 불러오기
		List<TendencyDTO> list = dao.list();
		mav.addObject("list", list);

		
		return mav;
	}//list() end
}//class end
