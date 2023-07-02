package kr.co.itwill.perorder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PerorderDAO {

	public PerorderDAO() {
		System.out.println("-----PerorderDAO()객체 생성됨");
	}
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
}//class end
