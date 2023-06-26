package kr.co.itwill.faq;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public FaqDAO() {
		System.out.println("-----FaqDAO() 객체생성됨");
	}//end
	

	
	
	public List<FaqDTO> list() {
		List<FaqDTO> list=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT f_no, f_cate, f_question, f_answer ");
			sql.append(" FROM faq ");
			
			RowMapper<FaqDTO> rowMapper=new RowMapper<FaqDTO>() {
				@Override
				public FaqDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
					FaqDTO dto=new FaqDTO();
					dto.setF_no(rs.getInt("f_no"));
					dto.setF_cate(rs.getString("f_cate"));
					dto.setF_question(rs.getString("f_question"));
					dto.setF_answer(rs.getString("f_answer"));
					return dto;
					}
				};
				list=jt.query(sql.toString(), rowMapper);
			}catch(Exception e) {
				System.out.println("list 목록실패: " + e);
			}
			return list;
		}//list() end
	
	
	
	public List<FaqDTO> list2() {
		List<FaqDTO> list2=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT f_no, f_cate, f_question, f_answer ");
			sql.append(" FROM faq ");
			
			RowMapper<FaqDTO> rowMapper=new RowMapper<FaqDTO>() {
				@Override
				public FaqDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
					FaqDTO dto=new FaqDTO();
					dto.setF_no(rs.getInt("f_no"));
					dto.setF_cate(rs.getString("f_cate"));
					dto.setF_question(rs.getString("f_question"));
					dto.setF_answer(rs.getString("f_answer"));
					return dto;
					}
				};
				list2=jt.query(sql.toString(), rowMapper);
			}catch(Exception e) {
				System.out.println("list 목록실패: " + e);
			}
			return list2;
		}//list2() end
	
	
	public int create(FaqDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO faq(f_no, f_cate, f_question, f_answer) ");
			sql.append(" VALUES(null, ?, ?, ?) ");
			
			cnt=jt.update(sql.toString(), dto.getF_cate(), dto.getF_question(), dto.getF_answer());
		}catch(Exception e) {
			System.out.println("작성 실패: " + e);
		}//end
		return cnt;
	}//create end
	
	
	public FaqDTO read(int f_no) {
		FaqDTO dto=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT f_no, f_cate, f_question, f_answer ");
			sql.append(" FROM faq ");
			sql.append(" WHERE f_no =" + f_no );
			
			RowMapper<FaqDTO> rowMapper=new RowMapper<FaqDTO>() {
				@Override
				public FaqDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
					FaqDTO dto=new FaqDTO();
					dto.setF_no(rs.getInt("f_no"));
					dto.setF_cate(rs.getString("f_cate"));
					dto.setF_question(rs.getString("f_question"));
					dto.setF_answer(rs.getString("f_answer"));
					return dto;
				}
			};
			dto=jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("상세보기 실패: " + e);
		}
		return dto;
	}//read() end
	
	
	public int delete (int f_no) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" DELETE FROM faq ");
			sql.append(" WHERE f_no = ? ");
			
			cnt=jt.update(sql.toString(), f_no);
		}catch(Exception e) {
			System.out.println("FAQ 삭제실패: " + e);
		}//end
		return cnt;
	}//delete() end
}//class() end
