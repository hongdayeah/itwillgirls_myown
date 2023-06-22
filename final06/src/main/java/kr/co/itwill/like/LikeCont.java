package kr.co.itwill.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LikeCont {

	@Autowired
	private LikeDAO dao;
	
	public LikeCont() {
		System.out.println("-----LikeCont()객체 생성됨");
	}
	
	//관심프로그램 등록(찜하기)
	/*
	@PostMapping("/likeprogram/like.do")
    @ResponseBody
    public String addLike(@RequestParam("pro_obj") String proObj) {
        // Logic to insert like into the database using DAO
        dao.insertLike(pro_obj);
        
        // Return a response message
        return "Like added successfully";
    }
    */
}//class end
