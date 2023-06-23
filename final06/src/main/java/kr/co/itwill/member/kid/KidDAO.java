package kr.co.itwill.member.kid;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.member.MemberDTO;

@Repository
public class KidDAO {

	@Autowired
	private JdbcTemplate jt;
	
	private StringBuilder sql = null;
	
	public KidDAO() {
		System.out.println("-----MediaDAO() 객체 생성됨");
	}//end
	
	
	public List<MemberKidDTO> list(String p_id){
		
		// 세션 아이디값 담는 방법 고민해보자~
		// MemberCont에서는 아래처럼 했음
		
		// 세션에 있는 값을 가져와서 변수에 넣기
		// MemberDTO member_dto = (MemberDTO) session.getAttribute("member_dto");

		// 세션에 있는 아이디 가져오기
		// String p_id = member_dto.getP_id();
		
		List<MemberKidDTO> list = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT k_name, k_birth, k_gender, p_id, typename ");
			sql.append(" FROM member_kid ");
			//sql.append(" WHERE p_id = '" + p_id + "' "); // String값 가져오려면 앞 뒤로 따옴표 넣어줭야 함 끝에 공백 잊지말기!!
			sql.append(" WHERE p_id = '" + p_id + "' ");
			sql.append(" ORDER BY k_no ");
			
			RowMapper<MemberKidDTO> rowMapper = new RowMapper<MemberKidDTO>() {
				@Override
				public MemberKidDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MemberKidDTO dto = new MemberKidDTO();
					dto.setK_name(rs.getString("k_name"));
					dto.setK_birth(rs.getString("k_birth"));
					dto.setK_gender(rs.getInt("k_gender"));
					dto.setP_id(rs.getString("p_id")); //여기에 p_id가 안 담기는 거니?!ㅠㅠ
					dto.setTypename(rs.getString("typename"));
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
			System.out.println(list); // [] 비어있다고 나옴 -> 위의 p_id를 빼면 나머지 값이 담김
			
		} catch (Exception e) {
			System.out.println("자녀 회원 목록 실패:" + e);
		}//end
		return list;
	}//list() end
	
	public int create(MemberKidDTO dto) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			sql.append(" INSERT INTO member_kid(k_name, k_birth, k_gender, p_id, typename) ");
			sql.append(" VALUES(?, ?, ?, ?, ?) "); //typename = null값일 때도 잘 보이나?
			
			cnt = jt.update(sql.toString(), dto.getK_name(), dto.getK_birth(), dto.getK_gender(), dto.getP_id(), dto.getTypename());
			
		} catch (Exception e) {
			System.out.println("자녀 회원 등록 실패" + e);
		}//end
		return cnt;
	}//create() end
	
}//class end
