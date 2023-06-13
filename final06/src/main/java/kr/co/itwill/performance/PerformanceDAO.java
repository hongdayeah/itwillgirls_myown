package kr.co.itwill.performance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PerformanceDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public PerformanceDAO() {
		System.out.println("-----PerformanceDAO() 객체 생성됨");
	}//end
	
	
}
