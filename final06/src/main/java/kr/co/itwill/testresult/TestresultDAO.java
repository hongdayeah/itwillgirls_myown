package kr.co.itwill.testresult;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.member.kid.MemberKidDTO;

@Repository
public class TestresultDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public TestresultDAO() {
		System.out.println("-----TestresultDAO()객체 생성됨");
	}
	
	//등록
	public int create(String p_id, String k_name, int k_no) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO testresult(p_id, k_name, k_no) ");
			sql.append(" VALUES(?, ?, ?) ");
			
			cnt = jt.update(sql.toString(), p_id, k_name, k_no);
		}catch(Exception e) {
			System.out.println("테스트 결과에서의 p_id, k_name, k_no 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
	
	//p_id=?인 자녀 목록 조회하는 함수
	public List<MemberKidDTO> klist(String p_id){
		List<MemberKidDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT k_no, k_name, p_id ");
			sql.append(" FROM member_kid ");
			sql.append(" WHERE p_id = '" + p_id + "' ");
			
			RowMapper<MemberKidDTO> rowMapper = new RowMapper<MemberKidDTO>() {
				@Override
				public MemberKidDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					MemberKidDTO dto = new MemberKidDTO();
					
					dto.setK_no(rs.getInt("k_no"));
					dto.setK_name(rs.getString("k_name"));
					dto.setP_id(rs.getString("p_id"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("Testresult에서의 자녀 목록 조회 실패 : " + e);
		}
		
		return list;
	}//klist() end
	
	
	//k_no=?인 행의 자녀 이름 조회해서 문자열 반환
	public String kread(int k_no) {
		String k_name = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT k_name ");
			sql.append(" FROM member_kid ");
			sql.append(" WHERE k_no = " + k_no);
			
			k_name = jt.queryForObject(sql.toString(), new Object[]{k_no}, String.class);
			
		}catch(Exception e) {
			System.out.println("Testresult에서 k_no에 해당하는 자녀 이름 조회 실패 : " + e);
		}
		
		return k_name;
	}//kread() end
	
	//stest의 결과 값 저장하기 (기존 행에 값 새로 추가)
	public int sresupdate(int k_no, String sresult) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE testresult ");
			sql.append(" SET sresult = ? ");
			sql.append(" WHERE k_no = ? ");
			
			cnt = jt.update(sql.toString(), sresult, k_no);
		}catch(Exception e) {
			System.out.println("Testresult에서 sung테스트 결과 값 저장 실패 : " + e);
		}
		
		return cnt;
	}//sresupdate() end
	
	//htest의 결과 값 저장하기 (기존 행에 값 새로 추가)
	public int hresupdate(int k_no, String hresult) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE testresult ");
			sql.append(" SET hresult = ? ");
			sql.append(" WHERE k_no = ? ");
			
			cnt = jt.update(sql.toString(), hresult, k_no);
		}catch(Exception e) {
			System.out.println("Testresult에서 hyang테스트 결과 값 저장 실패 : " + e);
		}
		
		return cnt;
	}//hresupdate() end
	
	//hupdateProc에 sresult 값 반환
	public String sread(int k_no) {
		String sresult = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT sresult ");
			sql.append(" FROM testresult ");
			sql.append(" WHERE k_no = " + k_no);
			
			sresult = jt.queryForObject(sql.toString(), new Object[]{k_no}, String.class);
		}catch(Exception e) {
			System.out.println("hresupdateProc에서 sresult값 반환 실패 : " + e);
		}
		
		return sresult;
	}//sread() end
	
	public int shupdate(int k_no, String sresult, String hresult) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE testresult ");
			sql.append(" SET typename = (SELECT GROUP_CONCAT(?, ?) AS type ");
			sql.append(" FROM testresult ");
			sql.append(" WHERE k_no = ?) ");
			sql.append(" WHERE k_no = ? ");
			
			cnt = jt.update(sql.toString(), sresult, hresult, k_no, k_no);
		}catch(Exception e) {
			System.out.println("hresupdateProc에서 sresult+hresult 실패 : " + e);
		}
		
		return cnt;
	}//shupdate() end
	
	public String tread(int k_no) {
		String typename = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT typename ");
			sql.append(" FROM testresult ");
			sql.append(" WHERE k_no = " + k_no);
			
			typename = jt.queryForObject(sql.toString(), new Object[]{k_no}, String.class);
		}catch(Exception e) {
			System.out.println("hresupdateProc에서 sresult값 반환 실패 : " + e);
		}
		
		return typename;
	}//sread() end
	
	//member_kid 의 typename 컬럼 update
	public int kidtypeupdate(int k_no) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE member_kid ");
			sql.append(" SET typename = (SELECT typename FROM testresult WHERE k_no = ? ) ");
			sql.append(" WHERE k_no = ? ");
			
			cnt = jt.update(sql.toString(), k_no, k_no);
		}catch(Exception e) {
			System.out.println("hresupdateProc에서 member_kid로 typename update 실패 : " + e);
		}
		
		return cnt;
	}//kidtypeupdate() end
}//class end
