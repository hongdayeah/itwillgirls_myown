package kr.co.itwill.program;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProgramDAO {

	@Autowired
	private JdbcTemplate jt;
	StringBuilder sql = null;
	
	public ProgramDAO() {
		System.out.println("-----ProgramDAO() 객체 생성됨");
	}
	
}
