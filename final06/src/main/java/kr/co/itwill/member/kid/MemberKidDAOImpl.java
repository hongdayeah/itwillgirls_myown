package kr.co.itwill.member.kid;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class MemberKidDAOImpl implements MemberKidDAO {
	
	@Autowired
	SqlSession sqlSession; // mybatis 실행 객체
	
	// 자녀 회원 등록
	@Override
	public void addKid(MemberKidDTO kid_dto) throws Exception {
	}// addKid() end
	
	// 자녀 회원 목록
	@Override
	public List<MemberKidDTO> kidList() throws Exception {
		return sqlSession.selectList("member.kidList");
	}// kidList() end
	
}// class end
