package kr.co.itwill.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itwill.mapper.MemberMapper;
import kr.co.itwill.member.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper membermapper;
	
	//회원가입
	@Override
	public void memberJoin(MemberDTO dto) throws Exception {
		membermapper.memberJoin(dto);
	}//memberJoin() end
	
	/*
	@Override
	public void memberJoin(Map<String, Object> map) throws Exception {
		membermapper.memberJoin(map);
	}
	*/
	
	//아이디 중복확인
	@Override
	public int idCheck(String p_id) throws Exception {
		return membermapper.idCheck(p_id);
	}//idCheck() end
	
	//로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return membermapper.login(dto);
	}//memberLogin() end
}//class end
