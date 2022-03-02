package project.spring.web.side_menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SideMenuController {
	
	@RequestMapping("/sideMune.do")
	public ModelAndView sideMunuDo(ModelAndView mav) {
		mav.setViewName("sideMenu");
		return mav;
	}
}
