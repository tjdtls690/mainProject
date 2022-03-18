package project.spring.web.adminLogin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.adminLogin.AdminLoginVO;

@Repository
public class AdminLoginDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminLoginVO> getAdminInfo(AdminLoginVO vo) {
		return sqlSessionTemplate.selectList("AdminLoginDAO.getAdminInfo", vo);
	}
}
