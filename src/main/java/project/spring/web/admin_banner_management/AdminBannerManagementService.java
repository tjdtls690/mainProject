package project.spring.web.admin_banner_management;

import java.util.List;

public interface AdminBannerManagementService {
	
	public List<AdminBannerManagementVO> getBanner(AdminBannerManagementVO vo);
	
	void deleteBanner(AdminBannerManagementVO vo);
	
	int insertBanner(AdminBannerManagementVO vo);
}
