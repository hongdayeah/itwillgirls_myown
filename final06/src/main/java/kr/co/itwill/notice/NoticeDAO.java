package kr.co.itwill.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public NoticeDAO() {
		System.out.println("-----NoticeDAO() 객체 생성됨");
	}//end
	
	public int create(NoticeDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO notice(not_no, not_cate, not_sub, not_con, not_regdt, not_filename ");
			sql.append(" VALUE(?, ?, ?, ?, ?, ?");
			
			cnt=jt.update(sql.toString(), dto.getNot_no(), dto.getNot_cate(), dto.getNot_sub(), dto.getNot_con(), dto.getNot_regdt(), dto.getNot_filename());
		} catch(Exception e) {
			System.out.println("목록 실패: " + e);
		}//end
			return cnt;
		}//create end
		
	
}