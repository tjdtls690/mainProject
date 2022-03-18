package project.spring.web.admin_main_chart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainChartController {
	
	
	@RequestMapping("/adminMainChrat.mdo")
	public ModelAndView adminMainChartDo(ModelAndView mav) {
		mav.addObject("check10", 100000);
		mav.setViewName("mainChart");
		return mav;
	}
}
