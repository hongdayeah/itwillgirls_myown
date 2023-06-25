package kr.co.itwill.program;


import java.io.StringBufferInputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.itwill.like.LikeDTO;
import kr.co.itwill.protime.ProtimeDTO;

@Repository
public class ProgramDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public ProgramDAO() {
		System.out.println("-----ProgramDAO() 객체 생성됨");
	}
	
	//등록
	public int create(ProgramDTO dto) {
		
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" INSERT INTO program_info(pro_obj, pro_name, prochar_no, pro_limit, pro_fee, ");
			sql.append(" prorec_start, prorec_end, proper_start, proper_end, pro_day, pro_age, pro_exp, pro_poster, pro_img, pro_regdate) ");
			sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()) ");
			
			cnt = jt.update(sql.toString(), dto.getPro_obj(), dto.getPro_name(), dto.getProchar_no(), dto.getPro_limit(), dto.getPro_fee(), dto.getProrec_start(), dto.getProrec_end(), dto.getProper_start(), dto.getProper_end(), dto.getPro_day(), dto.getPro_age(), dto.getPro_exp(), dto.getPro_poster(), dto.getPro_img(), dto.getPro_regdate());			
		}catch(Exception e) {
			System.out.println("프로그램 등록 실패 : " + e);
		}
		
		return cnt;
	}//create() end
	
	//목록
	public List<ProgramDTO> list(){
		List<ProgramDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT pro_obj, pro_name, prochar_no, pro_limit, pro_fee, prorec_start, prorec_end, ");
			sql.append(" proper_start, proper_end, pro_day, pro_age, pro_exp, ");
			sql.append(" pro_poster, pro_img, pro_regdate, pro_readcnt ");
			sql.append(" FROM program_info ");
			sql.append(" ORDER BY pro_regdate DESC ");
			
			RowMapper<ProgramDTO> rowMapper = new RowMapper<ProgramDTO>() {
				@Override
				public ProgramDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					ProgramDTO dto = new ProgramDTO();
					
					dto.setPro_obj(rs.getString("pro_obj"));
					dto.setPro_name(rs.getString("pro_name"));
					dto.setProchar_no(rs.getString("prochar_no"));
					dto.setPro_limit(rs.getInt("pro_limit"));
					dto.setPro_fee(rs.getInt("pro_fee"));
					dto.setProrec_start(rs.getString("prorec_start"));
					dto.setProrec_end(rs.getString("prorec_end"));
					dto.setProper_start(rs.getString("proper_start"));
					dto.setProper_end(rs.getString("proper_end"));
					dto.setPro_day(rs.getString("pro_day"));
					dto.setPro_age(rs.getString("pro_age"));
					dto.setPro_exp(rs.getString("pro_exp"));
					dto.setPro_poster(rs.getString("pro_poster"));
					dto.setPro_img(rs.getString("pro_img"));
					dto.setPro_regdate(rs.getString("pro_regdate"));
					dto.setPro_readcnt(rs.getInt("pro_readcnt"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("프로그램 목록 조회 실패 : " + e);
		}
		
		return list;
	}//list() end

	//상세보기
	public ProgramDTO read(String pro_obj) {
		ProgramDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT pro_obj, pro_name, prochar_no, pro_limit, pro_fee, prorec_start, prorec_end, ");
			sql.append(" proper_start, proper_end, pro_day, pro_age, pro_exp, ");
			sql.append(" pro_poster, pro_img, pro_regdate, pro_readcnt ");
			sql.append(" FROM program_info ");
			sql.append(" WHERE pro_obj = '" + pro_obj + "' ");
			
			RowMapper<ProgramDTO> rowMapper = new RowMapper<ProgramDTO>() {
				@Override
				public ProgramDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					ProgramDTO dto = new ProgramDTO();
					
					dto.setPro_obj(rs.getString("pro_obj"));
					dto.setPro_name(rs.getString("pro_name"));
					dto.setProchar_no(rs.getString("prochar_no"));
					dto.setPro_limit(rs.getInt("pro_limit"));
					dto.setPro_fee(rs.getInt("pro_fee"));
					dto.setProrec_start(rs.getString("prorec_start"));
					dto.setProrec_end(rs.getString("prorec_end"));
					dto.setProper_start(rs.getString("proper_start"));
					dto.setProper_end(rs.getString("proper_end"));
					dto.setPro_day(rs.getString("pro_day"));
					dto.setPro_age(rs.getString("pro_age"));
					dto.setPro_exp(rs.getString("pro_exp"));
					dto.setPro_poster(rs.getString("pro_poster"));
					dto.setPro_img(rs.getString("pro_img"));
					dto.setPro_regdate(rs.getString("pro_regdate"));
					dto.setPro_readcnt(rs.getInt("pro_readcnt"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("프로그램 상세보기 실패 : " + e);
		}
		
		return dto;
	}//read() end
	
	//수정
	public int update(ProgramDTO dto) {
		int cnt = 0;
		
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE program_info ");
			sql.append(" SET pro_obj = ?, pro_name = ?, prochar_no =?, pro_limit =?, pro_fee =?, ");
			sql.append(" prorec_start = ?, prorec_end = ?, proper_start = ?, proper_end = ?, pro_day = ?, ");
			sql.append(" pro_age = ?, pro_exp = ?, pro_poster = ?, pro_img = ?, pro_regdate = now() ");
			sql.append(" WHERE pro_obj = ? ");
			
			cnt = jt.update(sql.toString(), dto.getPro_obj(), dto.getPro_name(), dto.getProchar_no(), dto.getPro_limit(), dto.getPro_fee(), dto.getProrec_start(), dto.getProrec_end(), dto.getProper_start(), dto.getProper_end(), dto.getPro_day(), dto.getPro_age(), dto.getPro_exp(), dto.getPro_poster(), dto.getPro_img(), dto.getPro_obj());
			
		}catch(Exception e) {
			System.out.println("프로그램 수정 실패 : " + e);
		}
		
		return cnt;
	}//update() end
	
	//program_time 상세조회 하는 함수
	@SuppressWarnings("deprecation")
	public List<ProtimeDTO> ptlist(String pro_obj) {
		List<ProtimeDTO> list = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT pro_time, t_code ");
			sql.append(" FROM program_time ");
			sql.append(" WHERE pro_obj = ? ");
			
			RowMapper<ProtimeDTO> rowMapper = new RowMapper<ProtimeDTO>() {
				@Override
				public ProtimeDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					ProtimeDTO dto = new ProtimeDTO();
					
					dto.setPro_time(rs.getString("pro_time"));
					dto.setT_code(rs.getString("t_code"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list = jt.query(sql.toString(), new Object[]{pro_obj}, rowMapper);
		}catch(Exception e) {
			System.out.println("program에서의 시간표 상세리스트 조회 실패 : " + e);
		}
		
		return list;
	}//ptlist() end
	
	//조회수 증가
	public void incrementCnt(String pro_obj) {
		
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE program_info ");
			sql.append(" SET pro_readcnt = pro_readcnt+1 ");
			sql.append(" WHERE pro_obj = ? ");

			jt.update(sql.toString(), pro_obj);
		}catch(Exception e) {
			System.out.println("조회수 증가 실패 : " + e);
		}
	}//incrementCnt() end
	
	//like_program 상세조회하는 함수
	public LikeDTO likeread(String pro_obj, String p_id) {
		LikeDTO dto = null;
		
		try {
			sql = new StringBuilder();
			sql.append(" SELECT pro_obj, p_id ");
			sql.append(" FROM like_program ");
			sql.append(" WHERE pro_obj = '" + pro_obj +"' AND p_id = '" + p_id + "' ");
			
			RowMapper<LikeDTO> rowMapper = new RowMapper<LikeDTO>() {
				@Override
				public LikeDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					LikeDTO dto = new LikeDTO();
					
					dto.setPro_obj(rs.getString("pro_obj"));
					dto.setP_id(rs.getString("p_id"));
					
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			dto = jt.queryForObject(sql.toString(), rowMapper);
		}catch(Exception e) {
			System.out.println("program에서의 찜 상세보기 조회 실패 : " + e);
		}
		
		return dto;
	}//likeread() end
}//class end
