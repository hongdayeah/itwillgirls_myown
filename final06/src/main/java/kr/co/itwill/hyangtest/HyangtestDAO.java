package kr.co.itwill.hyangtest;

import java.io.StringBufferInputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.sungtest.SungtestDTO;

@Repository
public class HyangtestDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public HyangtestDAO() {
		System.out.println("-----HyangtestDAO()객체 생성됨");
	}
	
	//등록
	public int create(HyangtestDTO dto) {
		
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO hyang_test(htest_name) ");
			sql.append(" VALUES (?) ");
			
			cnt = jt.update(sql.toString(), dto.getHtest_name());
		}catch(Exception e) {
			System.out.println("SUNG test 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
	
	//목록
	public List<HyangtestDTO> list(){
		List<HyangtestDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT htest_no, htest_name ");
			sql.append(" FROM hyang_test ");
			sql.append(" ORDER BY htest_no DESC ");
			
			RowMapper<HyangtestDTO> rowMapper = new RowMapper<HyangtestDTO>() {
				@Override
				public HyangtestDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					HyangtestDTO dto = new HyangtestDTO();
					
					dto.setHtest_no(rs.getInt("htest_no"));
					dto.setHtest_name(rs.getString("htest_name"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("HYANG test 목록 조회 실패 : " + e);
		}
		
		return list;
	}//list() end
	
	//상세보기 (수정을 위해)
	public HyangtestDTO read(int htest_no) {
		HyangtestDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT htest_no, htest_name ");
			sql.append(" FROM hyang_test ");
			sql.append(" WHERE htest_no = " + htest_no);
			
			RowMapper<HyangtestDTO> rowMapper = new RowMapper<HyangtestDTO>() {
				@Override
				public HyangtestDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					HyangtestDTO dto = new HyangtestDTO();
					
					dto.setHtest_no(rs.getInt("htest_no"));
					dto.setHtest_name(rs.getString("htest_name"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("HYANG test 상세보기 실패 : " + e);
		}
		
		return dto;
	}//read() end
	
	//수정
	public int update(HyangtestDTO dto) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE hyang_test ");
			sql.append(" SET htest_name = ? ");
			sql.append(" WHERE htest_no = ? ");
			
			cnt = jt.update(sql.toString(), dto.getHtest_name(), dto.getHtest_no());
			
		}catch(Exception e) {
			System.out.println("HYANG test 수정 실패 : " + e);
		}
		
		return cnt;
	}//update() end
	
	//삭제
	public int delete(int htest_no) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" DELETE FROM hyang_test ");
			sql.append(" WHERE htest_no = ? ");
			
			cnt = jt.update(sql.toString(), htest_no);
		}catch(Exception e) {
			System.out.println("HYANG test 삭제 실패 : " + e);
		}
		
		return cnt;
	}//delete() end
	
	//자녀 이름 조회
	public String hknameread(int k_no) {
		String k_name = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT k_name ");
			sql.append(" FROM testresult ");
			sql.append(" WHERE k_no = " + k_no);
			
			k_name = jt.queryForObject(sql.toString(), new Object[]{k_no}, String.class);
			
		}catch(Exception e) {
			System.out.println("HYANG test에서 k_name 조회 실패 : " + e);
		}
		
		return k_name;
	}//hknameread() end
	
	//질문 10개 목록 랜덤 추출 조회
	public List<String> hrandlist(int num){
		List<String> list = new ArrayList<>();
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT htest_name FROM hyang_test ORDER BY RAND() LIMIT ? ");
			
			list = jt.queryForList(sql.toString(), new Object[]{num}, String.class);
		}catch(Exception e) {
			System.out.println("HYANG test에서 랜덤 추출 조회 실패 : " + e);
		}
		
		return list;
	}//hrandlist() end
}//class end
