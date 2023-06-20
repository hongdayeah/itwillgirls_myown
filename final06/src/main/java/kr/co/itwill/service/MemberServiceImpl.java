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

	// 회원탈퇴
	@Override
	public void memberDelete(MemberDTO dto) throws Exception {
		membermapper.memberDelete(dto);
	}// memberDelete() end

}// class end
