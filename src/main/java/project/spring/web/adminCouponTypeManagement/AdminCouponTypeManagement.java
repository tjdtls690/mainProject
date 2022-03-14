package project.spring.web.adminCouponTypeManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminCouponTypeManagement {
	
	
	@RequestMapping("/adminCouponTypeManagement.mdo")
	public ModelAndView adminCouponTypeManagementDo(ModelAndView mav) {
		mav.setViewName("couponTypeManagement");
		return mav;
	}
}
