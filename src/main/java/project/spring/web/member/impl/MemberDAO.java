package project.spring.web.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.member.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int checkEmail(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.emailCheck", vo);
	}
	
	public MemberVO getMember(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMember", vo);
	}
	
	public int insertMember(MemberVO vo) {
		return sqlSessionTemplate.insert("MemberDAO.insertMember", vo);
	}
	
	public int checkPhone(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.phoneCheck", vo);
	}
	
	public MemberVO getMemberPhone(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.getMemberPhone", vo);
	}
	
	public int passwordCheck(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.passwordCheck", vo);
	}
	
	public int findEmail(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.findEmail", vo);
	}
	
	public MemberVO phoneNameGetMember(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.phoneNameGetMember", vo);
	}
}
