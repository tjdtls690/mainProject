package project.spring.web.adminMemberManagement.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.adminMemberManagement.AdminMemberManagementVO;
import project.spring.web.event.CouponVO;

@Repository
public class AdminMemberManagementDAO {
	private static SqlSessionTemplate sqlSession;
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminMemberManagementVO> getAdminMember(AdminMemberManagementVO vo){
		return sqlSessionTemplate.selectList("AdminMemberManagementDAO.getAdminMember", vo);
	}
	public void deleteMember(AdminMemberManagementVO vo) {
		sqlSessionTemplate.delete("AdminMemberManagementDAO.deleteMember", vo);
	}
	public void getActiveMember(AdminMemberManagementVO vo){
		 sqlSessionTemplate.update("AdminMemberManagementDAO.getActiveMember", vo);
	}
	/*
	 * public List<AdminMemberManagementVO> getMemberDelite(AdminMemberManagementVO
	 * vo){ return
	 * sqlSessionTemplate.selectList("AdminMemberManagementDAO.getMemberDelite",
	 * vo); }
	 */
	/*public static int memberDel(Integer memberCode) {
		
		return sqlSession.update("memberDel",memberCode);
	}
*/
}
