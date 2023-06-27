package kr.co.itwill.like;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.member.MemberDTO;
import kr.co.itwill.program.ProgramDTO;

@Repository
public class LikeDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public LikeDAO() {
		System.out.println("-----LikeDAO()객체 생성됨");
	}
	
	//MemberDTO에서 회원 정보 해당되는 한 행 데려오기
	public MemberDTO memread(String p_id) {
		MemberDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT p_id ");
			sql.append(" FROM member_parent ");
			sql.append(" WHERE p_id = '" + p_id + "' ");
			
			RowMapper<MemberDTO> rowMapper = new RowMapper<MemberDTO>() {
				@Override
				public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					MemberDTO dto = new MemberDTO();
					
					dto.setP_id(rs.getString("p_id"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("LikeDAO에서 회원 상세보기 실패 : " + e);
		}
		
		return dto;
	}//memread() end
	
	//ProgramDTO에서 pro_obj 해당되는 한 행 데려오기
	public ProgramDTO proread(String pro_obj) {
		ProgramDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT pro_obj, pro_name ");
			sql.append(" FROM program_info ");
			sql.append(" WHERE pro_obj = '" + pro_obj + "' ");
			
			RowMapper<ProgramDTO> rowMapper = new RowMapper<ProgramDTO>() {
				@Override
				public ProgramDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					ProgramDTO dto = new ProgramDTO();
					
					dto.setPro_obj(rs.getString("pro_obj"));
					dto.setPro_name(rs.getString("pro_name"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("LikeDAO에서 pro_obj 상세보기 실패 : " + e);
		}
		
		return dto;
	}//proread() end
	
	//찜 추가
	public int create(LikeDTO dto) {
		
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO like_program(pro_obj, p_id) ");
			sql.append(" VALUES (?, ?) ");
			
			cnt = jt.update(sql.toString(), dto.getPro_obj(), dto.getP_id());
		}catch(Exception e) {
			System.out.println("찜 추가 실패 : " + e);
		}
		
		return cnt;
	}//create() end
	
	public LikeDTO read(String pro_obj, String p_id) {
		LikeDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT pro_obj, p_id ");
			sql.append(" FROM like_program ");
			sql.append(" WHERE pro_obj = '" + pro_obj + "' and p_id = '" + p_id + "' ");
			
			RowMapper<LikeDTO> rowMapper = new RowMapper<LikeDTO>() {
				@Override
				public LikeDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					LikeDTO dto = new LikeDTO();
					
					dto.setPro_obj(rs.getString("pro_obj"));
					dto.setP_id(rs.getString("p_id"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("찜 상세보기 실패 : " + e);
		}
		
		return dto;
	}//read() end
	
	public int delete(String pro_obj, String p_id) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" DELETE FROM like_program ");
			sql.append(" WHERE pro_obj = ? AND p_id = ? ");
			
			cnt = jt.update(sql.toString(), pro_obj, p_id);
		}catch(Exception e) {
			System.out.println("찜 삭제 실패 : " + e);
		}
		
		return cnt;
	}//delete() end
}//class end
