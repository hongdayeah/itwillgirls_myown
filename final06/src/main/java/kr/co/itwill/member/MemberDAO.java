package kr.co.itwill.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MemberDAO {

	public MemberDAO() {
		System.out.println("-----MemberDAO() 객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public int memberlistInsert(MemberDTO dto) {
		return sqlSession.insert("member.memberlistInsert", dto);
	}//orderlistInsert() end	
	
}//class end
