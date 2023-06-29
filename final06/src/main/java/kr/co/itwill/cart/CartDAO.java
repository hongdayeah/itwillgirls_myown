package kr.co.itwill.cart;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.iwill.performanceSeat.PerformanceSeatDTO;

@Repository
public class CartDAO {
	
	public CartDAO() {
		System.out.println("-----CartDAO 객체 생성됨");
	} //end

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public int seatInsert (PerformanceSeatDTO perseatdto) {
		int cnt=0;
		
		try {
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO perSeat(row, col, isReserved, per_code)" );
			sql.append(" VALUES (?,?,1,?)");
			
			cnt=jt.update(sql.toString(), perseatdto.getRow(), perseatdto.getCol(), perseatdto.getPer_code());
			
		} catch(Exception e){
			System.out.println("등록 실패"+e);	
		}
		return cnt;
	} //perInsert() end

	
	
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
	
	public List<CartDTO> cartList(String p_id){
		List<CartDTO> list=null;
		
		try {
			sql=new StringBuilder();
			sql.append(" SELECT cart_no, p_id, pro_code, per_code, seat_no, k_no, pro_cnt ");
			sql.append(" FROM cart ");
			sql.append(" WHERE p_id = ? ");
			
			RowMapper<CartDTO> rowMapper=new RowMapper<CartDTO>() {
				@Override
				public CartDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					CartDTO dto=new CartDTO();
					
					dto.setCart_no(rs.getInt("cart_no"));
					dto.setP_id(rs.getString("p_id"));
					dto.setPro_code(rs.getString("pro_code"));
					dto.setPer_code(rs.getString("per_code"));
					dto.setSeat_no(rs.getString("seat_no"));
					dto.setK_no(rs.getInt("k_no"));
					dto.setPro_cnt(rs.getInt("pro_cnt"));
					
					return dto;				
				} //mapRow() end
			}; //rowMapper end
			
			list=jt.query(sql.toString(),new Object[]{p_id}, rowMapper);
			
		} catch(Exception e) {
			System.out.println("조회 실패" + e);
		}
		
		return list;
	}// cartList() end

	//프로그램 장바구니 담기
	public int proInsert(String p_id, String pro_code, int pro_cnt) {
		int cnt=0;
		
		try{
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO cart(cart_no, p_id, pro_code, pro_cnt)");
			sql.append(" VALUES(null,?,?,?) ");
			
			//SQL문 (insert, update, delete) 실행
			cnt=jt.update(sql.toString(), p_id, pro_code, pro_cnt);
		} catch (Exception e) {
			System.out.println("프로그램 장바구니 등록 실패 : " + e);			
		}		
		return cnt;		
	} //perInsert() end
} //CartDAO() end
