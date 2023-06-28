package kr.co.itwill.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ParentDAO {

	@Autowired
	private JdbcTemplate jt;
	
	private StringBuilder sql = null;
	
	public ParentDAO() {
		System.out.println("-----ParentDAO() 객체 생성됨");
	}// end
	
	// 관리자 계정 - 관리자 페이지(일반 회원의 마이페이지 개념) - 전체 회원 목록 보여주기
	public List<MemberDTO> list(String p_id) {
		
		List<MemberDTO> list = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT p_id, p_name, p_birth, p_gender, p_tell, p_email, p_grade, p_date ");
			sql.append(" FROM member_parent ");
			sql.append(" ORDER BY p_name ");
			
			RowMapper<MemberDTO> rowMapper = new RowMapper<MemberDTO>() {
				@Override
				public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MemberDTO dto = new MemberDTO();
					dto.setP_id(rs.getString("p_id"));
					dto.setP_name(rs.getString("p_name"));
					dto.setP_birth(rs.getString("p_birth"));
					dto.setP_gender(rs.getInt("p_gender"));
					dto.setP_tell(rs.getString("p_tell"));
					dto.setP_email(rs.getString("p_email"));
					dto.setP_grade(rs.getString("p_grade"));
					dto.setP_date(rs.getString("p_date"));
					return dto;
				}// mapRow() end
			};// rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
			System.out.println(list);
			
		} catch (Exception e) {
			System.out.println("전체 회원 목록 조회 실패: " + e);
		}//end
		
		return list;
	}// list() end
	
}// class end
