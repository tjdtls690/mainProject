package project.spring.web.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	
	@RequestMapping("/search.do")
	public ModelAndView searchDo(ModelAndView mav) {
		
		mav.setViewName("search");
		return mav;
	}
}
