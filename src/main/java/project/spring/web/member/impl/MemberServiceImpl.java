package project.spring.web.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public int checkEmail(MemberVO vo) {
		return memberDAO.checkEmail(vo);
	}
	
	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		return memberDAO.insertMember(vo);
	}

	@Override
	public int checkPhone(MemberVO vo) {
		return memberDAO.checkPhone(vo);
	}

	@Override
	public MemberVO getMemberPhone(MemberVO vo) {
		return memberDAO.getMemberPhone(vo);
	}
	
}
