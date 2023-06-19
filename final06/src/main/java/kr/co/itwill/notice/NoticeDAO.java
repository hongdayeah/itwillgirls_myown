package kr.co.itwill.notice;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public NoticeDAO() {
		System.out.println("-----NoticeDAO() 객체 생성됨");
	}//end
	
	public List<NoticeDTO> list(){
		List<NoticeDTO> list=null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT not_no, not_cate, not_sub, not_con, not_regdt, not_filename, not_size" );
			sql.append(" FROM notice ");
			
			RowMapper<NoticeDTO> rowMapper=new RowMapper<NoticeDTO>() {
				@Override
				public NoticeDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
					NoticeDTO dto=new NoticeDTO();
				dto.setNot_no(rs.getInt("not_no"));
				dto.setNot_cate(rs.getString("not_cate"));
				dto.setNot_sub(rs.getString("not_sub"));
				dto.setNot_con(rs.getString("not_con"));
				dto.setNot_regdt(rs.getString("not_regdt"));
				dto.setNot_filename(rs.getString("not_filename"));
				dto.setNot_size(rs.getLong("not_size"));
				return dto;
				}
			};
			list=jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("list 목록 실패: " + e);
		}
		return list;
	}//list() end
	
	public int create(NoticeDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			
			sql.append(" INSERT INTO notice(not_no, not_cate, not_sub, not_con, not_regdt, not_filename ");
			sql.append(" VALUE(notice_seq.nextval, ?, ?, ?, now(), ?) ");
			
			cnt=jt.update(sql.toString(), dto.getNot_cate(), dto.getNot_sub(), dto.getNot_con(), dto.getNot_filename());
		} catch(Exception e) {
			System.out.println("목록 실패: " + e);
		}//end
			return cnt;
		}//create end
		
	
	
	
}