package kr.co.itwill.sungtest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SungtestDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public SungtestDAO() {
		System.out.println("-----SungtestDAO()객체 생성됨");
	}
	
	
}//class end
