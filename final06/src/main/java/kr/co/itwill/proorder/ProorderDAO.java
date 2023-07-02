package kr.co.itwill.proorder;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.perorder.PerorderDTO;

@Repository
public class ProorderDAO {

	public ProorderDAO() {
		System.out.println("-----ProorderDAO()객체 생성됨");
	}
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	//p_id=?인 프로그램 예매 목록 조회
	public List<ProorderDTO> proorderlist(String p_id){
		List<ProorderDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT order_prodetailno, pro_fee, order_no, pro_obj, pro_cnt, pro_name, p_id ");
			sql.append(" FROM order_prodetail ");
			sql.append(" WHERE p_id = '" + p_id + "' ");
			sql.append(" ORDER BY order_prodetailno DESC ");
			
			RowMapper<ProorderDTO> rowMapper = new RowMapper<ProorderDTO>() {
				@Override
				public ProorderDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					ProorderDTO dto = new ProorderDTO();
					
					dto.setOrder_prodetailno(rs.getString("order_prodetailno"));
					dto.setPro_fee(rs.getInt("pro_fee"));
					dto.setOrder_no(rs.getString("order_no"));
					dto.setPro_obj(rs.getString("pro_obj"));
					dto.setPro_cnt(rs.getInt("pro_cnt"));
					dto.setPro_name(rs.getString("pro_name"));
					dto.setP_id(rs.getString("p_id"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list=jt.query(sql.toString(),new Object[]{p_id}, rowMapper);
		}catch(Exception e) {
			System.out.println("ProorderDAO에서 프로그램 예매 내역 조회 실패 : " + e);
		}
		
		return list;
	}//proorderlist() end
	
	
	//p_id=?인 공연 예매 목록 조회
	public List<PerorderDTO> perorderlist(String p_id) {
		List<PerorderDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT order_perdetailno, seat_no, per_fee, order_no, per_code, per_name, per_cnt, p_id ");
			sql.append(" FROM order_perdetail ");
			sql.append(" WHERE p_id ='" + p_id + "' ");
			sql.append(" ORDER BY order_perdetailno DESC ");
			
			RowMapper<PerorderDTO> rowMapper = new RowMapper<PerorderDTO>() {
				@Override
				public PerorderDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					PerorderDTO dto = new PerorderDTO();
					
					dto.setOrder_perdetailno(rs.getString("order_perdetailno"));
					dto.setSeat_no(rs.getString("seat_no"));
					dto.setPer_fee(rs.getInt("per_fee"));
					dto.setOrder_no(rs.getString("order_no"));
					dto.setPer_code(rs.getString("per_code"));
					dto.setPer_name(rs.getString("per_name"));
					dto.setPer_cnt(rs.getInt("per_cnt"));
					dto.setP_id(rs.getString("p_id"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list=jt.query(sql.toString(),new Object[]{p_id}, rowMapper);
		}catch(Exception e) {
			System.out.println("ProorderDAO에서 공연 예매 내역 조회 실패 : " + e);
		}
		
		return list;
	}//perorderlist() end
	
} //class end
