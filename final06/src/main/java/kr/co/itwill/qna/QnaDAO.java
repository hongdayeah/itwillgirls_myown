package kr.co.itwill.qna;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql=null;
	
	public QnaDAO() {
		System.out.println("-----QnaDAO() 객체생성됨");
	}//end

	public int create(QnaDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO qna(q_sub, q_con, q_regdt, q_grpno, p_id) ");
			sql.append(" VALUES(?, ?, now(), ((select ifnull(max(q_no),0)+1 from qna ALIAS_FOR_SUBQUERY)), ?) ");
			
			cnt=jt.update(sql.toString(), dto.getQ_sub(), dto.getQ_con(), dto.getP_id());
		}catch(Exception e) {
			System.out.println("작성 실패: " + e);
		}//end()
		return cnt;
	}//createForm() end
	
	
	
	public List<QnaDTO> list() {
		List<QnaDTO> list=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT q_no, q_sub, q_regdt, p_id ");
			sql.append(" FROM qna ");
			sql.append(" order by q_grpno DESC, q_ansnu ASC ");
			
			RowMapper<QnaDTO> rowMapper=new RowMapper<QnaDTO>() {
				@Override
				public QnaDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
					QnaDTO dto=new QnaDTO();
				dto.setQ_no(rs.getInt("q_no"));
				dto.setQ_sub(rs.getNString("q_sub"));
				dto.setQ_regdt(rs.getString("q_regdt"));
				dto.setP_id(rs.getString("p_id"));
				return dto;
				}
			};
			list=jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("list 목록실패: " + e);
		}
		return list;
	}//list() end
	
	
	public QnaDTO read(int q_no) {
		QnaDTO dto=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT q_no, q_sub, q_con, q_regdt, p_id ");
			sql.append(" FROM qna ");
			sql.append(" WHERE q_no =" + q_no);
			
			RowMapper<QnaDTO> rowMapper=new RowMapper<QnaDTO>() {
				@Override
				public QnaDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
					QnaDTO dto=new QnaDTO();
					dto.setQ_no(rs.getInt("q_no"));
					dto.setQ_sub(rs.getString("q_sub"));
					dto.setQ_con(rs.getString("q_con"));
					dto.setQ_regdt(rs.getString("q_regdt"));
					dto.setP_id(rs.getString("p_id"));
					return dto;
				}
			};
			dto=jt.queryForObject(sql.toString(), rowMapper);
			
		}catch(Exception e) {
			System.out.println("상세보기 실패: " + e);
		}
		System.out.println(dto);
		return dto;
	}//read() end
	
	public int delete(int q_no) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" DELETE FROM qna ");
			sql.append(" WHERE q_no = ? ");
			
			cnt=jt.update(sql.toString(), q_no);
		}catch(Exception e) {
			System.out.println("QNA 삭제실패 : " + e);
		}
		return cnt;
	}//delete() end
	
	
	public int update(QnaDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" UPDATE qna ");
			sql.append(" SET q_sub=?, q_con=? ");
			sql.append(" WHERE q_no=? ");
			
			cnt=jt.update(sql.toString(), dto.getQ_sub(), dto.getQ_con(), dto.getQ_no());
			
		}catch(Exception e) {
			System.out.println("수정실패: " + e);
		}
		return cnt;
	}//update() end
	
	/*
	public int reply(QnaDTO dto) {
	    int cnt = 0;
	    StringBuilder sql = new StringBuilder();

	    int q_grpno = 0;
	    int q_indent = 0;
	    int q_ansnu = 0;
	    sql.append("SELECT q_grpno, q_indent, q_ansnu ");
	    sql.append("FROM qna ");
	    sql.append("WHERE q_no = ? ");
	    jt.update(sql.toString(), dto.getQ_no());
	    System.out.println(cnt);
	    try {
	        q_grpno = jt.queryForObject(sql.toString(), Integer.class, dto.getQ_no());
	        q_indent = q_grpno + 1;
	        q_ansnu = q_grpno + 1;

	        sql.setLength(0);
	        sql.append("UPDATE qna ");
	        sql.append("SET q_ansnu = q_ansnu + 1 ");
	        sql.append("WHERE q_grpno = ? AND q_ansnu >= ? ");
	        jt.update(sql.toString(), q_grpno, q_ansnu);

	        sql.setLength(0);
	        sql.append("INSERT INTO qna (q_no, q_sub, q_con, q_regdt, p_id, q_grpno, q_indent, q_ansnu) ");
	        sql.append("VALUES (null, ?, ?, now(), ?, ?, ?, ?) ");

	        cnt = jt.update(sql.toString(), dto.getQ_sub(), dto.getQ_con(), dto.getP_id(), q_grpno, q_indent, q_ansnu);
	    } catch (Exception e) {
	        System.out.println("답변쓰기 실패: " + e);
	    }
	    return cnt;
	}//reply() end
	*/
	
	public int reply(QnaDTO dto) {
		int cnt = 0;
		StringBuilder sql = new StringBuilder();

		int q_grpno = 0;
		int q_indent = 0;
		int q_ansnu = 0;

		try {
		    // q_grpno, q_indent, q_ansnu 값을 조회
		    sql.setLength(0);
		    sql.append("SELECT q_grpno, q_indent, q_ansnu ");
		    sql.append("FROM qna ");
		    sql.append("WHERE q_no = ? ");

		    Map<String, Object> resultMap = jt.queryForMap(sql.toString(), dto.getQ_no());
		    q_grpno = (int) resultMap.get("q_grpno");
		    q_indent = (int) resultMap.get("q_indent");
		    q_ansnu = (int) resultMap.get("q_ansnu");

		    // q_ansnu 값 업데이트
		    sql.setLength(0);
		    sql.append("UPDATE qna ");
		    sql.append("SET q_ansnu = q_ansnu + 1 ");
		    sql.append("WHERE q_grpno = ? AND q_ansnu >= ? ");
		    jt.update(sql.toString(), q_grpno, q_ansnu);

		    // 답변 추가
		    sql.setLength(0);
		    sql.append("INSERT INTO qna (q_no, q_sub, q_con, q_regdt, p_id, q_grpno, q_indent, q_ansnu) ");
		    sql.append("VALUES (null, ?, ?, now(), ?, ?, ?, ?) ");

		    cnt = jt.update(sql.toString(), dto.getQ_sub(), dto.getQ_con(), dto.getP_id(), q_grpno, q_indent + 1, q_ansnu + 1);
		} catch (Exception e) {
		    System.out.println("답변쓰기 실패: " + e);
		}

		return cnt;
	}//reply() end
	
}//class() end
