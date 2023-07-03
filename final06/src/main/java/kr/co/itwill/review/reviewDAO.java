package kr.co.itwill.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class reviewDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public reviewDAO() {
		System.out.println("-----ReviewDAO()객체 생성됨");
	}
	
	//등록
	public int create(String pro_obj, String p_id, String rev_con, String p_passwd) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO pro_review(rev_con, rev_regdt, p_id, pro_obj, p_passwd)" );
			sql.append(" VALUES (?, now(), ?, ?, ?) ");
			
			cnt = jt.update(sql.toString(), rev_con, p_id, pro_obj, p_passwd);
			
		}catch(Exception e) {
			System.out.println("후기 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
	
	//주문상세내역에서 p_id와 pro_obj 찾기
	public boolean readobj(String p_id, String pro_obj) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) ");
			sql.append(" FROM order_prodetail ");
			sql.append(" WHERE p_id='" + p_id + "' AND pro_obj = '" + pro_obj + "' ");
			
			cnt= jt.queryForObject(sql.toString(), Integer.class, p_id, pro_obj);
			
			return cnt>0;
		}catch(Exception e) {
			System.out.println("reviewDAO에서 pro_obj와 p_id 찾기 실패 : " + e);
			return false;
		}
	}//readobj() end
}//class end
