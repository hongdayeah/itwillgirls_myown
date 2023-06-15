package kr.co.itwill.service;

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
	
}//class end
