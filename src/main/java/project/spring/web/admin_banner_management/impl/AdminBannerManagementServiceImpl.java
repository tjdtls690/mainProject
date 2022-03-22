package project.spring.web.admin_banner_management.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.admin_banner_management.AdminBannerManagementService;
import project.spring.web.admin_banner_management.AdminBannerManagementVO;

@Service("AdminBannerManagementService")
public class AdminBannerManagementServiceImpl implements AdminBannerManagementService {
	
	@Autowired
	AdminBannerManagementDAO BannerDAO;
	
	@Override
	public List<AdminBannerManagementVO> getBanner(AdminBannerManagementVO vo) {
		return BannerDAO.getBanner(vo);
	}

	@Override
	public void deleteBanner(AdminBannerManagementVO vo) {
		BannerDAO.deleteBanner(vo);
	}

	@Override
	public int insertBanner(AdminBannerManagementVO vo) {
		return BannerDAO.insertBanner(vo);
	}
	
}
