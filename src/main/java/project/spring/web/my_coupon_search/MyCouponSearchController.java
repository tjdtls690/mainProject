package project.spring.web.my_coupon_search;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyCouponSearchController {
	
	
	@RequestMapping("myCouponSearch.do")
	public ModelAndView myCouponSearchDo(ModelAndView mav, HttpServletRequest request) {
		String couponName = request.getParameter("couponName");
		System.out.println(couponName);
		mav.addObject("couponName",couponName);
		mav.setViewName("myCouponSearch");
		return mav;
	}
}
