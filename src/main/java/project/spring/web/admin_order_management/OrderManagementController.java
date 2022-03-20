package project.spring.web.admin_order_management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderManagementController {
	
	
	@RequestMapping("/orderManagement.mdo")
	public ModelAndView orderManagementDo(ModelAndView mav) {
		mav.setViewName("orderManagement");
		return mav;
	}
}
