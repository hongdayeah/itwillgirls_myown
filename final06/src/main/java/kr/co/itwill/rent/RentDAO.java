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
	
	public List<RentDTO> list(String rent_code){
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
	
}//class end