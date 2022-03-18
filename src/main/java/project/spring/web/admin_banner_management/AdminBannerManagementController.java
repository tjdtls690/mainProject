package project.spring.web.admin_banner_management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminBannerManagementController {
	
	
	@RequestMapping("/bannerManagement.mdo")
	public ModelAndView bannerManagementDo(ModelAndView mav) {
		mav.setViewName("bannerManagement");
		return mav;
	}
	
	@RequestMapping("/bannerModal.mdo")
	public ModelAndView bannerModalDo(ModelAndView mav) {
		mav.setViewName("bannerModal");
		return mav;
	}
}
