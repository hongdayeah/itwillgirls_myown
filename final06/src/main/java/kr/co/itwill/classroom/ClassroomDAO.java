package kr.co.itwill.classroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClassroomDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public ClassroomDAO() {
		System.out.println("-----ClassroomDAO()객체 생성됨");
	}
}//class end
