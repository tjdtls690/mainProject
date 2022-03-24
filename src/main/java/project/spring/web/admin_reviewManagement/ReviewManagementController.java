package project.spring.web.admin_reviewManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewManagementController {
	@RequestMapping("/reviewManagement.mdo")
	public ModelAndView ReviewManagement(ModelAndView mav) {
		
		mav.setViewName("reviewManagement");
		return mav;
	}

}
