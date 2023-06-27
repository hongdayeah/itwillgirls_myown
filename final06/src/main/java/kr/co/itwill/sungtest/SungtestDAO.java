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
	
	//등록
	public int create(SungtestDTO dto) {
		
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO sung_test(stest_name) ");
			sql.append(" VALUES (?) ");
			
			cnt = jt.update(sql.toString(), dto.getStest_name());
		}catch(Exception e) {
			System.out.println("SUNG test 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
}//class end
