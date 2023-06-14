package kr.co.itwill.rent;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RentDAO {
	
	@Autowired
	private JdbcTemplate jt;

	StringBuilder sql = null;
	
	public RentDAO() {
		System.out.println("-----RentDAO() 객체 생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public void insert(Map<String, Object> map) {
		sqlSession.insert("rent.rentForm", map);
	}//insert() end
	
	
}//class end