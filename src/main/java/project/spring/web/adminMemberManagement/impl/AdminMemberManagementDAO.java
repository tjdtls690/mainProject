package project.spring.web.adminMemberManagement.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.adminMemberManagement.AdminMemberManagementVO;

@Repository
public class AdminMemberManagementDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminMemberManagementVO> getAdminMember(AdminMemberManagementVO vo){
		return sqlSessionTemplate.selectList("AdminMemberManagementDAO.getAdminMember", vo);
	}

}
