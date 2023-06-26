package kr.co.itwill.testresult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TestresultDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public TestresultDAO() {
		System.out.println("-----TestresultDAO()객체 생성됨");
	}
	
	//등록
	public int create(String p_id, String k_name) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO testresult(p_id, k_name) ");
			sql.append(" VALUES(?, ?) ");
			
			cnt = jt.update(sql.toString(), p_id, k_name);
		}catch(Exception e) {
			System.out.println("테스트 결과에서의 p_id, k_name 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
}//class end
