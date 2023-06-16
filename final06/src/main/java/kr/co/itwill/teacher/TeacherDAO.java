package kr.co.itwill.teacher;

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
public class TeacherDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;   
	
	public TeacherDAO() {
		System.out.println("-----TeacherDAO() 객체 생성됨");
	}
	
	public int create(TeacherDTO dto) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			sql.append(" INSERT INTO teacher(t_code, t_name, t_phone, t_birth, t_gender, t_photo) ");
			sql.append(" VALUES( ?, ?, ?, ?, ?, ?, ?) ");
			
			cnt = jt.update(sql.toString(), dto.getT_code(), dto.getT_name(), dto.getT_phone(), dto.getT_birth(), dto.getT_gender(), dto.getT_photo());
		}catch(Exception e){
			System.out.println("강사 등록 실패 : " + e);
		}//end
		
		return cnt;
	}//create() end

	
	public List<TeacherDTO> list(){
		List<TeacherDTO> list = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT t_code, t_name, t_phone, t_birth, t_gender, t_photo ");
			sql.append("FROM teacher ");
			sql.append(" ORDER BY t_code ASC ");
			
			RowMapper<TeacherDTO> rowMapper = new RowMapper<TeacherDTO>() {
				@Override
				public TeacherDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					TeacherDTO dto = new TeacherDTO();
					dto.setT_code(rs.getString("t_code"));
					dto.setT_name(rs.getString("t_name"));
					dto.setT_phone(rs.getString("t_phone"));
					dto.setT_birth(rs.getString("t_birth"));
					dto.setT_gender(rs.getInt("t_gender"));
					dto.setT_photo(rs.getString("t_photo"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e){
			System.out.println("강사 목록 조회 실패 : " + e);
		}
		return list;
	}//list() end
	
	public TeacherDTO read(String t_code) {
		TeacherDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT t_code, t_name, t_phone, t_birth, t_gender, t_photo ");
			sql.append(" FROM teacher");
			sql.append(" WHERE t_code = '" + t_code + "' ");
			
			RowMapper<TeacherDTO> rowMapper = new RowMapper<TeacherDTO>() {
				@Override
				public TeacherDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					TeacherDTO dto = new TeacherDTO();
					dto.setT_code(rs.getString("t_code"));
					dto.setT_name(rs.getString("t_name"));
					dto.setT_phone(rs.getString("t_phone"));
					dto.setT_birth(rs.getString("t_birth"));
					dto.setT_gender(rs.getInt("t_gender"));
					dto.setT_photo(rs.getString("t_photo"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("강사 상세보기 실패 : " + e);
		}
		
		return dto;
	}
}//class end
