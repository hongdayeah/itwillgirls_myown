package kr.co.itwill.protime;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.classroom.ClassroomDTO;
import kr.co.itwill.program.ProgramDTO;
import kr.co.itwill.teacher.TeacherDTO;

@Repository
public class ProtimeDAO {

	@Autowired
	private JdbcTemplate jt;
	
	@Autowired
	private ProgramDTO prodto; //안씀
	
	@Autowired
	private ClassroomDTO classdto; //안씀
	
	@Autowired
	private TeacherDTO tdto; //안씀
	
	StringBuilder sql = null;
	
	public ProtimeDAO() {
		System.out.println("-----ProtimeDAO() 객체 생성됨");
	}
	
	//강사 목록 조회하는 함수
	public List<TeacherDTO> tlist(){
		List<TeacherDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT t_code, t_name ");
			sql.append(" FROM teacher");
			sql.append(" ORDER BY t_code ");
			
			RowMapper<TeacherDTO> rowMapper = new RowMapper<TeacherDTO>() {
				@Override
				public TeacherDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					TeacherDTO dto = new TeacherDTO();
					
					dto.setT_code(rs.getString("t_code"));
					dto.setT_name(rs.getString("t_name"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("Protime에서의 강사 목록 조회 실패 : " + e);
		}
		
		return list;
	}//tlist() end
	
	
	//장소 목록 조회하는 함수
	public List<ClassroomDTO> clist(){
		List<ClassroomDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT class_code, class_name ");
			sql.append(" FROM room_class ");
			sql.append(" ORDER BY class_code ");
			
			RowMapper<ClassroomDTO> rowMapper = new RowMapper<ClassroomDTO>() {
				@Override
				public ClassroomDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					ClassroomDTO dto = new ClassroomDTO();
					
					dto.setClass_code(rs.getString("class_code"));
					dto.setClass_name(rs.getString("class_name"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("Protime에서의 장소 목록 조회 실패 : " + e);
		}
		
		return list;
	}//clist() end
	
	//등록
	public int create(ProtimeDTO dto) {
		
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO program_time(pro_code, pro_time, pro_obj, class_code, t_code) ");
			sql.append(" VALUES (?, ?, ?, ?, ?) ");
			
			cnt = jt.update(sql.toString(), dto.getPro_code(), dto.getPro_time(), dto.getPro_obj(), dto.getClass_code(), dto.getT_code());
			
		}catch(Exception e) {
			System.out.println("프로그램 시간표 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
	
}//class end
