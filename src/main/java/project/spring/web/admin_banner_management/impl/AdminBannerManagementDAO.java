package project.spring.web.admin_banner_management.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_banner_management.AdminBannerManagementVO;

@Repository
public class AdminBannerManagementDAO {
	
	@Autowired
	private  SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminBannerManagementVO> getBanner(AdminBannerManagementVO vo) {
		return sqlSessionTemplate.selectList("AdminBannerManagementDAO.getBanner", vo);
	}
	
	public void deleteBanner(AdminBannerManagementVO vo) {
		 sqlSessionTemplate.delete("AdminBannerManagementDAO.deleteBanner", vo);
	}
	
	public int insertBanner(AdminBannerManagementVO vo) {
		return sqlSessionTemplate.insert("AdminBannerManagementDAO.insertBanner", vo);
	}
	
}
