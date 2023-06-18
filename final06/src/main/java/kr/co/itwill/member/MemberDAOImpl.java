package kr.co.itwill.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository //현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession; //mybatis 실행 객체
	
	//회원가입
	@Override
	public void memberJoin(MemberDTO dto) {
	}
	
	//아이디 중복확인
	@Override
	public int idCheck(String p_id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//로그인 체크
	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name = sqlSession.selectOne("member.loginCheck", dto);
		return (name == null) ? false : true;
	}//loginCheck() end
	
	//로그인 정보
	@Override
	public MemberDTO viewMember(MemberDTO dto) {
		return sqlSession.selectOne("member.viewMember", dto);
	}//viewMember() end
	
	//로그아웃
	@Override
	public void logout(HttpSession session) {
	}//logout() end
	
	
	
	
	
}//class end
