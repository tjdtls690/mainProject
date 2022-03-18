package project.spring.web.adminOrderManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminOrderManagementContoller {
	
	@RequestMapping("/orderManagement.mdo")
	public ModelAndView orderManagementDo(ModelAndView mav) {
		
		mav.setViewName("orderManagement");
		return mav;
	}

}
