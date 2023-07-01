package kr.co.itwill.orderform;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class OrderformDAO {

	public OrderformDAO() {
		System.out.println("-----OrderformDAO()객체 생성됨");
	}
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	//orderform에 필요한 정보 등록
	public int orderInsert(String p_id, int order_cnt, int tot_price) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO orderform (order_no, tot_price, order_cnt, p_id) ");
			sql.append(" 						SELECT CONCAT(YEAR(NOW()), DATE_FORMAT(NOW(), '%m%d%H%i%s'), ");
			sql.append(" 						'-', LPAD((SELECT COUNT(*) + 1 FROM orderform), 3, '0')), " + tot_price + ", " + order_cnt + " , '" + p_id + "' ");			
			
			cnt = jt.update(sql.toString(), p_id, order_cnt, tot_price);
		}catch(Exception e) {
			System.out.println("orderform 행 삽입 실패 :" + e);
		}
		
		return cnt;
	}//orderInsert() end
	
	//orderform.jsp에 정보 띄우기 --> read(p_id=?인 행 조회)
	public OrderformDTO orderRead(String p_id){
		OrderformDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT order_no, p_id, order_cnt, tot_price, payc");
			sql.append(" FROM orderform ");
			sql.append(" WHERE p_id = '" + p_id + "' ");
			
			RowMapper<OrderformDTO> rowMapper = new RowMapper<OrderformDTO>() {
				@Override
				public OrderformDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					OrderformDTO dto = new OrderformDTO();
					
					dto.setOrder_no(rs.getString("order_no"));
					dto.setP_id(rs.getString("p_id"));
					dto.setOrder_cnt(rs.getInt("order_cnt"));
					dto.setTot_price(rs.getInt("tot_price"));
					dto.setPayc(rs.getString("payc"));
					
					return dto;					
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("orderForm에서 상세조회 실패 : " + e);
		}
		
		return dto;
	}//formlist() end
}//OrderformDAO() end
