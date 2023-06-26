package kr.co.itwill.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	
	public CartDAO() {
		System.out.println("-----CartDAO 객체 생성됨");
	} //end

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public int perInsert(CartDTO dto) {
		int cnt=0;
		
		try{
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO cart(cart_no, p_id, per_code, seat_no)");
			sql.append(" VALUES(null,?,?,?) ");
			
			//SQL문 (insert, update, delete) 실행
			cnt=jt.update(sql.toString(), dto.getP_id(), dto.getPer_code(), dto.getSeat_no() );
		} catch (Exception e) {
			System.out.println("등록 실패"+e);			
		}		
		return cnt;		
	} //perInsert() end

}
