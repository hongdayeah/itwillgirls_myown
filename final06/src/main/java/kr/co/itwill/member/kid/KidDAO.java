package kr.co.itwill.member.kid;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class KidDAO {

	@Autowired
	private JdbcTemplate jt;

	private StringBuilder sql = null;

	public KidDAO() {
		System.out.println("-----MediaDAO() 객체 생성됨");
	}// end

	// 자녀 회원 목록 보기
	public List<MemberKidDTO> list(String p_id) {

		List<MemberKidDTO> list = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT k_no, k_name, k_birth, k_gender, p_id, typename ");
			sql.append(" FROM member_kid ");
			// sql.append(" WHERE p_id = '" + p_id + "' "); // String값 가져오려면 앞 뒤로 따옴표 넣어줘야 함
			// 끝에 공백 잊지말기!!
			// sql.append(" WHERE p_id = '" + p_id + "' ");
			sql.append(" ORDER BY k_no ");

			RowMapper<MemberKidDTO> rowMapper = new RowMapper<MemberKidDTO>() {
				@Override
				public MemberKidDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MemberKidDTO dto = new MemberKidDTO();
					dto.setK_no(rs.getInt("k_no"));
					dto.setK_name(rs.getString("k_name"));
					dto.setK_birth(rs.getString("k_birth"));
					dto.setK_gender(rs.getInt("k_gender"));
					dto.setP_id(rs.getString("p_id"));
					dto.setTypename(rs.getString("typename"));
					return dto;
				}// mapRow() end
			};// rowMapper end

			list = jt.query(sql.toString(), rowMapper);
			System.out.println(list);

		} catch (Exception e) {
			System.out.println("자녀 회원 목록 실패:" + e);
		} // end
		return list;
	}// list() end

	// 자녀 회원 추가
	public int create(MemberKidDTO dto) {
		int cnt = 0;
		try {
			sql = new StringBuilder();

			sql.append(" INSERT INTO member_kid(k_name, k_birth, k_gender, p_id, typename) ");
			sql.append(" VALUES(?, ?, ?, ?, ?) ");

			cnt = jt.update(sql.toString(), dto.getK_name(), dto.getK_birth(), dto.getK_gender(), dto.getP_id(),
					dto.getTypename());

		} catch (Exception e) {
			System.out.println("자녀 회원 등록 실패" + e);
		} // end
		return cnt;
	}// create() end

	// 자녀 회원 상세 보기
	public MemberKidDTO read(int k_no) {
		MemberKidDTO dto = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT k_no, k_name, k_birth, k_gender, typename  ");
			sql.append(" FROM member_kid ");
			sql.append(" WHERE k_no = '" + k_no + "'");

			RowMapper<MemberKidDTO> rowMapper = new RowMapper<MemberKidDTO>() {
				@Override
				public MemberKidDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MemberKidDTO dto = new MemberKidDTO();
					dto.setK_no(rs.getInt("k_no"));
					dto.setK_name(rs.getString("k_name"));
					dto.setK_birth(rs.getString("k_birth"));
					dto.setK_gender(rs.getInt("k_gender"));
					dto.setTypename(rs.getString("typename"));
					return dto;
				} // mapRow() end
			}; // rowMapper end

			dto = jt.queryForObject(sql.toString(), rowMapper);

		} catch (Exception e) {
			System.out.println("자녀 회원 상세 보기 실패" + e);
		} // end

		return dto;

	} // read() end

	// 자녀 회원 수정
	public int update(MemberKidDTO dto) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE member_kid ");
			sql.append(" SET k_name=?, k_birth=?, k_gender=?, typename=? ");
			sql.append(" WHERE k_no=? ");

			cnt = jt.update(sql.toString(), dto.getK_name(), dto.getK_birth(), dto.getK_gender(), dto.getTypename(),
					dto.getK_no());

		} catch (Exception e) {
			System.out.println("자녀 회원 수정 실패" + e);
		} // end
		return cnt;
	} // update end

	// 자녀 회원 삭제
	public int delete(int k_no) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			sql.append(" DELETE FROM member_kid ");
			sql.append(" WHERE k_no = ? ");
			cnt = jt.update(sql.toString(), k_no);
		} catch (Exception e) {
			System.out.println("자녀 회원 삭제 실패: " + e);
		} // end
		return cnt;
	} // delete() end

}// class end
