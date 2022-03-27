package project.spring.web.adminMemberManagement;

import java.util.List;

import project.spring.web.adminMemberManagement.impl.AdminMemberManagementDAO;

public interface AdminMemberManagementService {

	public List<AdminMemberManagementVO> getAdminMember(AdminMemberManagementVO vo);
	
	//public List<AdminMemberManagementVO> getMemberDelite(AdminMemberManagementVO vo);

	//public static int memberDel(Integer memberCode) {
	
		//return AdminMemberManagementDAO.memberDel(memberCode);


	public void deleteMember(AdminMemberManagementVO vo); 

	public void getActiveMember(AdminMemberManagementVO vo);
	}


