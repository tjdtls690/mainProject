package project.spring.web.admin_main_chart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
//	값이 잘 넘어오는지 테스트
		for(int i=0; i<13; i++) {
//			System.out.print(i+"번째 sum : "+dayChartList.get(i).getDaySum()+"\n");
			
			mav.addObject("check"+i, dayChartList.get(i).getDaySum());
		}
		mav.addObject("startDay2",dayChartList.get(0).getDate());
		mav.addObject("startDay", dayChartList.get(12).getDate());
		mav.addObject("dayChart", dayChartList);
		
		
		mav.setViewName("mainChart");
		return mav;
	}
	
	@RequestMapping("/next.mdo")
	public ModelAndView nextDay(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("theDay");
		System.out.println("보여주는 마지막 날짜 : "+str);
		
		AdminMainChartVO vo = new AdminMainChartVO();
		vo.setDate(str);
		
		List<AdminMainChartVO> dayChartList = adminMainChartService.getDayChart(vo);

		
		mav.addObject("chart", dayChartList);
		mav.setViewName("mainForLine");
		return mav;
	}
	
	@RequestMapping("/prev.mdo")
	public ModelAndView prevDay(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("theDay");
		System.out.println("보여주는 마지막 날짜 : "+str);
		
		AdminMainChartVO vo = new AdminMainChartVO();
		vo.setDate(str);
		
		List<AdminMainChartVO> dayChartList = adminMainChartService.getDayChart2(vo);
		
		
		mav.addObject("chart", dayChartList);
		mav.setViewName("mainForLine");
		return mav;
	}
	
	
	
}
