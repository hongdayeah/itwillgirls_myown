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
}//class end
