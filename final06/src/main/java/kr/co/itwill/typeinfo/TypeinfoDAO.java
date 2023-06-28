package kr.co.itwill.typeinfo;

import java.io.StringBufferInputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TypeinfoDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public TypeinfoDAO() {
		System.out.println("-----TypeinfoDAO()객체 생성됨");
	}
	
	//등록
	public int create(TypeinfoDTO dto) {
		
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO typeinfo(typename, typeanimal, typeexp, typespec1, typespec2, typespec3, typespec4) ");
			sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?) ");
			
			cnt = jt.update(sql.toString(), dto.getTypename(), dto.getTypeanimal(), dto.getTypeexp(), dto.getTypespec1(), dto.getTypespec2(), dto.getTypespec3(), dto.getTypespec4());
		}catch(Exception e) {
			System.out.println("typeinfo 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
	
	//목록
	public List<TypeinfoDTO> list(){
		List<TypeinfoDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT typename, typeanimal, typeexp, typespec1, typespec2, typespec3, typespec4 ");
			sql.append(" FROM typeinfo ");
			sql.append(" ORDER BY typename ");
			
			RowMapper<TypeinfoDTO> rowMapper = new RowMapper<TypeinfoDTO>() {
				@Override
				public TypeinfoDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					TypeinfoDTO dto = new TypeinfoDTO();
					
					dto.setTypename(rs.getString("typename"));
					dto.setTypeanimal(rs.getString("typeanimal"));
					dto.setTypeexp(rs.getString("typeexp"));
					dto.setTypespec1(rs.getString("typespec1"));
					dto.setTypespec2(rs.getString("typespec2"));
					dto.setTypespec3(rs.getString("typespec3"));
					dto.setTypespec4(rs.getString("typespec4"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("관리자 mbti 목록 조회 실패 : " + e);
		}
		
		return list;
	}//list() end
	
	//상세보기
	public TypeinfoDTO read(String typename) {
		TypeinfoDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT typename, typeanimal, typeexp, typespec1, typespec2, typespec3, typespec4 ");
			sql.append(" FROM typeinfo ");
			sql.append(" WHERE typename = '" + typename + "' ");
			
			RowMapper<TypeinfoDTO> rowMapper = new RowMapper<TypeinfoDTO>() {
				@Override
				public TypeinfoDTO mapRow(ResultSet rs, int rowNum) throws SQLException {

					TypeinfoDTO dto = new TypeinfoDTO();
					
					dto.setTypename(rs.getString("typename"));
					dto.setTypeanimal(rs.getString("typeanimal"));
					dto.setTypeexp(rs.getString("typeexp"));
					dto.setTypespec1(rs.getString("typespec1"));
					dto.setTypespec2(rs.getString("typespec2"));
					dto.setTypespec3(rs.getString("typespec3"));
					dto.setTypespec4(rs.getString("typespec4"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("typeinfo 상세보기 실패 : " + e);
		}
		
		return dto;
	}//read() end
}//class end
