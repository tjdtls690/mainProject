package project.spring.web.my_coupon_search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyCouponSearchController {
	
	
	@RequestMapping("myCouponSearch.do")
	public ModelAndView myCouponSearchDo(ModelAndView mav) {
		mav.setViewName("myCouponSearch");
		return mav;
	}
}
