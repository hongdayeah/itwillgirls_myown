package kr.co.itwill.tendency;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TendencyDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public TendencyDAO() {
		System.out.println("-----TendencyDAO()객체 생성됨");
	}
	
	//목록
	public List<TendencyDTO> list(){
		List<TendencyDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT typename ");
			sql.append(" FROM type ");
			
			
			RowMapper<TendencyDTO> rowMapper = new RowMapper<TendencyDTO>() {
				@Override
				public TendencyDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					TendencyDTO dto = new TendencyDTO();
					
					dto.setTypename(rs.getString("typename"));
					
					return dto;
				}//mapRow() end
			};//RowMapper
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("성향 목록 조회 실패 : " + e);
		}
		
		return list;
	}//list() end
	
	
}//class end
