package project.spring.web.adminMemberManagement.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.adminMemberManagement.AdminMemberManagementService;
import project.spring.web.adminMemberManagement.AdminMemberManagementVO;

@Service("AdminMemberManagementService")
public class AdminMemberManagementServiceImpl implements AdminMemberManagementService {
	@Autowired
	AdminMemberManagementDAO adminMemberManagementDAO;

	@Override
	public List<AdminMemberManagementVO> getAdminMember(AdminMemberManagementVO vo) {

		return adminMemberManagementDAO.getAdminMember(vo);
	}

	/*
	 * @Override public List<AdminMemberManagementVO>
	 * getMemberDelite(AdminMemberManagementVO vo) {
	 * 
	 * return adminMemberManagementDAO.getAdminMember(vo); }
	 */
	@Override
	public void deleteMember(AdminMemberManagementVO vo) {
		adminMemberManagementDAO.deleteMember(vo);
	}

	@Override
	public void getActiveMember(AdminMemberManagementVO vo) {
		adminMemberManagementDAO.getActiveMember(vo);
	}
}
