package kr.co.itwill.program;


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
public class ProgramDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public ProgramDAO() {
		System.out.println("-----ProgramDAO() 객체 생성됨");
	}
	
	public List<ProgramDTO> list(){
		List<ProgramDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT pro_obj, pro_name, prochar_no, pro_limit, pro_fee, prorec_start, prorec_end, ");
			sql.append(" proper_start, proper_end, pro_day, pro_age, pro_exp, ");
			sql.append(" pro_poster, pro_img, pro_regdate, pro_readcnt ");
			sql.append(" FROM program_info ");
			sql.append(" ORDER BY pro_regdate DESC ");
			
			RowMapper<ProgramDTO> rowMapper = new RowMapper<ProgramDTO>() {
				@Override
				public ProgramDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					ProgramDTO dto = new ProgramDTO();
					dto.setPro_obj(rs.getString("pro_obj"));
					dto.setPro_name(rs.getString("pro_name"));
					dto.setProchar_no(rs.getString("prochar_no"));
					dto.setPro_limit(rs.getInt("pro_limit"));
					dto.setPro_fee(rs.getInt("pro_fee"));
					dto.setProrec_start(rs.getString("prorec_start"));
					dto.setProrec_end(rs.getString("prorec_end"));
					dto.setProper_start(rs.getString("proper_start"));
					dto.setProper_end(rs.getString("proper_end"));
					dto.setPro_day(rs.getString("pro_day"));
					dto.setPro_age(rs.getString("pro_age"));
					dto.setPro_exp(rs.getString("pro_exp"));
					dto.setPro_poster(rs.getString("pro_poster"));
					dto.setPro_img(rs.getString("pro_img"));
					dto.setPro_regdate(rs.getString("pro_regdate"));
					dto.setPro_readcnt(rs.getInt("pro_readcnt"));
					
					return dto;
				}//mapRow() end
			};//RowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("프로그램 목록 조회 실패 : " + e);
		}
		
		return list;
	}//list() end

	
}//class end
