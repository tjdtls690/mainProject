package project.spring.web.admin_statisticsDetail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminStatisticsDetailController {
	
	
	@RequestMapping("/pieChart.mdo")
	public ModelAndView pieChart(ModelAndView mav){
		
		mav.setViewName("pieChart");
		return mav;	
	}

}
