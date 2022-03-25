package project.spring.web.admin_reviewList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewListController {
	
	@RequestMapping("/reviewList.mdo")
	public ModelAndView ReviewList(ModelAndView mav) {
		
		mav.setViewName("reviewList");
		return mav;
	}

}
