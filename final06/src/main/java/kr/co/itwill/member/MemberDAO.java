package kr.co.itwill.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	//DBOpen dbopen = new DBOpen()와 동일한 형태
	//@Autowired 스프링컨테이너가 생성해 준 객체를 연결
	@Autowired
	private JdbcTemplate jt;

	StringBuilder sql = null;
	
	public MemberDAO() {
		System.out.println("-----MemberDAO() 객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("member.memberJoinForm", map);
	}//insert() end
	
	//로그인은 인서트가 아닌 것 같은데 조금 더 고민해 보자~
	public void login(Map<String, Object> map) {
		sqlSession.insert("member.memberLoginForm", map);
	}//login() end
	
	public void joinProc(Map<String, Object> map) {
		sqlSession.insert("member.joinProc", map);
	}//login() end
	
	
}//class end
