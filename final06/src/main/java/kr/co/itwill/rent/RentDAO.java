package kr.co.itwill.rent;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class RentDAO {
	
	@Autowired
	private JdbcTemplate jt;

	StringBuilder sql = null;
	
	public RentDAO() {
		System.out.println("-----RentDAO() 객체 생성됨");
	}//end
	
	public List<RentDTO> list(){
		List<RentDTO> list=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT rent_app, rent_group, rent_name, rent_date, rent_per, class_code" );
			sql.append(" FROM rent ");
			
			RowMapper<RentDTO> rowMapper=new RowMapper<RentDTO>() {
				@Override
				public RentDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
					RentDTO dto=new RentDTO();
					dto.setRent_app(rs.getString("rent_app"));
					dto.setRent_group(rs.getString("rent_group"));
					dto.setRent_name(rs.getString("rent_name"));
					dto.setRent_date(rs.getString("rent_date"));
					dto.setRent_per(rs.getString("rent_per"));
					dto.setClass_code(rs.getString("class_code"));
					return dto;
				}
			};
			list=jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("rent 목록 실패: " + e);
		}
		return list;
	}
	
	
	public int create(RentDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO rent(rent_code, rent_date, rent_group, rent_per, rent_name, rent_phone, rent_email, class_code, rent_app, rent_form, rent_size) ");
			sql.append("VALUES(?, ?, ?, ?, ?, ?, ? ,? ,now(), ?, ?)");
			
			cnt=jt.update(sql.toString(), dto.getRent_code(), dto.getRent_date(), dto.getRent_group(), dto.getRent_per(), dto.getRent_name(), dto.getRent_phone(), dto.getRent_email(), dto.getClass_code(), dto.getRent_app(), dto.getRent_form(), dto.getRent_size());
		} catch(Exception e) {
			System.out.println("제출 실패: "+e);
		}
		return cnt;
	}//create end
	
}//class end