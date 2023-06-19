package kr.co.itwill.protime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.co.itwill.classroom.ClassroomDTO;
import kr.co.itwill.program.ProgramDTO;
import kr.co.itwill.teacher.TeacherDTO;

@Repository
public class ProtimeDAO {

	@Autowired
	private JdbcTemplate jt;
	
	@Autowired
	private ProgramDTO prodto;
	
	@Autowired
	private ClassroomDTO classdto;
	
	@Autowired
	private TeacherDTO tdto;
	
	StringBuilder sql = null;
	
	public ProtimeDAO() {
		System.out.println("-----ProtimeDAO() 객체 생성됨");
	}
	
	//등록
	public int create(ProtimeDTO dto) {
		
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO program_time(pro_code, pro_time, pro_obj, class_code, t_code) ");
			sql.append(" VALUES (?, ?, ?, ?, ?) ");
			
			cnt = jt.update(sql.toString(), dto.getPro_code(), dto.getPro_time(), prodto.getPro_obj(), classdto.getClass_code(), tdto.getT_code());
			
		}catch(Exception e) {
			System.out.println("프로그램 시간표 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
	
}//class end
