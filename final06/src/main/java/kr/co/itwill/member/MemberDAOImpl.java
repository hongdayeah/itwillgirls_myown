package kr.co.itwill.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession; // mybatis 실행 객체

	// 회원가입
	@Override
	public void memberJoin(MemberDTO dto) {
	}// memberJoin() end

	// 아이디 중복확인
	@Override
	public int idCheck(String p_id) {
		return 0;
	}// idCheck() end

	// 패스워드 체크
	@Override
	public boolean pwCheck(String p_id, String p_passwd) throws Exception {
		boolean result = false;

		Map<String, String> map = new HashMap<>();
		map.put("p_id", p_id);
		map.put("p_passwd", p_passwd);
		int count = sqlSession.selectOne("member.pwCheck", map);

		if (count == 1) {
			result = true;
		} // if end

		return result;
	}// pwCheck() end

	// 회원탈퇴
	@Override
	public void withdrawProc(String p_id) throws Exception {
		sqlSession.delete("member.withdrawProc", p_id);
	}// withdrawProc() end

}// class end
