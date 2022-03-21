package project.spring.web.admin_main_chart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainChartController {
	
	@Autowired
	private AdminMainChartService adminMainChartService;
	
	@RequestMapping("/adminMainChart.mdo")
	public ModelAndView adminMainChartDo(ModelAndView mav) {
		
		List<AdminMainChartVO> dayChartList = adminMainChartService.dayChart(null);
	
		for(int i=0; i<2; i++) {
			System.out.println(dayChartList.get(i));
		}
		System.out.println("-----------");
		System.out.println(dayChartList.get(0).getDate());
		mav.addObject("dayChart", dayChartList);
		
		
		mav.addObject("check10", 10000);
		mav.setViewName("mainChart");
		return mav;
	}
}
