package kr.co.itwill.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itwill.mapper.MemberMapper;
import kr.co.itwill.member.MemberDAO;
import kr.co.itwill.member.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Autowired
	MemberMapper membermapper;

	@Autowired
	SqlSession sqlSession;

	// 회원가입
	@Override
	public void memberJoin(MemberDTO dto) throws Exception {
		membermapper.memberJoin(dto);
	}// memberJoin() end

	// 아이디 중복확인
	@Override
	public int idCheck(String p_id) throws Exception {
		return membermapper.idCheck(p_id);
	}// idCheck() end

	// 로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return membermapper.login(dto);
	}// login() end

	// 패스워드 체크
	@Override
	public boolean pwCheck(String p_id, String p_passwd) throws Exception {
		return membermapper.pwCheck(p_id, p_passwd);
	}// pwCheck() end

	// 회원탈퇴
	@Override
	public void withdrawProc(String p_id) throws Exception {
		membermapper.withdrawProc(p_id);
	}// withdrawProc() end

}// class end
