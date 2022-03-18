package project.spring.web.adminLogin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.adminLogin.AdminLoginService;
import project.spring.web.adminLogin.AdminLoginVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	AdminLoginDAO adminLoginDAO;
	
	@Override
	public List<AdminLoginVO> getAdminInfo(AdminLoginVO vo) {
		return adminLoginDAO.getAdminInfo(vo);
	}

}
