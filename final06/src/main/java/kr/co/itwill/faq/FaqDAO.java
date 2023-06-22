package kr.co.itwill.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public FaqDAO() {
		System.out.println("-----FaqDAO() 객체생성됨");
	}//end
}
