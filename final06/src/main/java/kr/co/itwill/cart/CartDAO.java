package kr.co.itwill.cart;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.performance.PerformanceDTO;
import kr.co.itwill.program.ProgramDTO;
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
			sql.append(" SELECT cart_no, p_id, pro_code, per_code, seat_no, k_no, cart_cnt, cart_price, pro_name, per_name ");
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
					dto.setCart_cnt(rs.getInt("cart_cnt"));
					dto.setCart_price(rs.getInt("cart_price"));
					dto.setPro_name(rs.getString("pro_name"));
					dto.setPer_name(rs.getString("per_name"));
					
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
	public int proInsert(String p_id, String pro_code, int cart_cnt, int pro_fee, String pro_name) {
		int cnt=0;
		
		try{
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO cart(cart_no, p_id, pro_code, cart_cnt, cart_price, pro_name) ");
			sql.append(" VALUES(null, ?, ?, ?, ?, ?) ");
			
			//SQL문 (insert, update, delete) 실행
			cnt=jt.update(sql.toString(), p_id, pro_code, cart_cnt, pro_fee, pro_name);
		} catch (Exception e) {
			System.out.println("프로그램 장바구니 등록 실패 : " + e);			
		}		
		return cnt;		
	} //perInsert() end
	
	
	public int perInsert2(String p_id, String per_code, String seat_no, int cart_cnt, int per_fee, String per_name) {
		int cnt=0;
		
		try{
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO cart(cart_no, p_id, per_code, seat_no, cart_cnt, cart_price, per_name) ");
			sql.append(" VALUES(null,?,?,?,?,?,?) ");
			
			//SQL문 (insert, update, delete) 실행
			cnt=jt.update(sql.toString(), p_id, per_code, seat_no, cart_cnt, per_fee, per_name );
		} catch (Exception e) {
			System.out.println("등록 실패"+e);			
		}		
		return cnt;		
	}
	
	//p_id가 장바구니에 담은 pro_code의 pro_name가져오기
	public List<ProgramDTO> pronamelist(String p_id){
		List<ProgramDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT pro_name FROM program_info ");
			sql.append(" WHERE pro_obj IN ( ");
			sql.append(" 					SELECT program_time.pro_obj ");
			sql.append(" 					FROM program_time ");
			sql.append(" 					JOIN cart ON program_time.pro_code = cart.pro_code ");
			sql.append(" 					WHERE cart.p_id = '" + p_id + "' AND cart.pro_code IS NOT NULL ");
			sql.append(" 					) ");
			
			RowMapper<ProgramDTO> rowMapper = new RowMapper<ProgramDTO>() {
				@Override
				public ProgramDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					ProgramDTO dto = new ProgramDTO();
					dto.setPro_name(rs.getString("pro_name"));
					
					return dto;					
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("CartDAO에서 pro_name 조회하기실패 : " + e);
		}
		return list;
	}//pronamelist() end
	
	//p_id=? 이면서 pro_code가 not null인 목록 조회
	public List<CartDTO> prolist(String p_id){
		List<CartDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT cart_no, p_id, pro_code, cart_cnt, cart_price, pro_name ");
			sql.append(" FROM cart ");
			sql.append(" WHERE p_id = '" + p_id + "' AND pro_code IS NOT NULL ");
			
			RowMapper<CartDTO> rowMapper = new RowMapper<CartDTO>() {
				@Override
				public CartDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					CartDTO dto = new CartDTO();
					
					dto.setCart_no(rs.getInt("cart_no"));
					dto.setP_id(rs.getString("p_id"));
					dto.setPro_code(rs.getString("pro_code"));
					dto.setCart_cnt(rs.getInt("cart_cnt"));
					dto.setCart_price(rs.getInt("cart_price"));
					dto.setPro_name(rs.getString("pro_name"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("CartDAO에서 program cartlist 조회 실패 : " + e);
		}
		
		return list;
	}//prolist() end
	
	public List<CartDTO> perlist(String p_id){
		List<CartDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT cart_no, p_id, per_code, seat_no, cart_cnt, cart_price, per_name ");
			sql.append(" FROM cart ");
			sql.append(" WHERE p_id = '" + p_id + "' AND per_code IS NOT NULL ");
			
			RowMapper<CartDTO> rowMapper = new RowMapper<CartDTO>() {
				@Override
				public CartDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					CartDTO dto = new CartDTO();
					
					dto.setCart_no(rs.getInt("cart_no"));
					dto.setP_id(rs.getString("p_id"));
					dto.setPer_code(rs.getString("per_code"));
					dto.setSeat_no(rs.getString("seat_no"));
					dto.setCart_cnt(rs.getInt("cart_cnt"));
					dto.setCart_price(rs.getInt("cart_price"));
					dto.setPer_name(rs.getString("per_name"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("CartDAO에서 performance cartlist 조회 실패 : " + e);
		}
		
		return list;
	}//perlist() end
	
	//장바구니 삭제 (결제 전)
	public int delete(int cart_no) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" DELETE FROM cart ");
			sql.append(" WHERE cart_no = " + cart_no);
			
			cnt = jt.update(sql.toString(), cart_no);
		}catch(Exception e) {
			System.out.println("장바구니 행 삭제 실패 : " + e);
		}
		
		return cnt;
	}//delete() end
	
	//orderform에서 p_id=?인 행의 order_no 조회
	public String readorderno(String p_id) {
		String order_no = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT order_no ");
			sql.append(" FROM orderform ");
			sql.append(" WHERE p_id = '" + p_id + "' ");
			
			order_no = jt.queryForObject(sql.toString(), new Object[]{order_no}, String.class);
		}catch(Exception e) {
			System.out.println("CartDAO에서 order_no 조회 실패 : " + e);
		}
		
		return order_no;
	}//readorderno() end
} //CartDAO() end
