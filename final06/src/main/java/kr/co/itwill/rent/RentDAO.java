package kr.co.itwill.rent;

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
	}
}