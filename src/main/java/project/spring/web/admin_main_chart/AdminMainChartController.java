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
//			System.out.println("라인차트");
//			System.out.print(i+"번째 date : "+dayChartList.get(i).getDate());
//			System.out.print(i+"번째 sum : "+dayChartList.get(i).getDaySum());
			
			mav.addObject("check"+i, dayChartList.get(i).getDaySum());
		}
		mav.addObject("startDay2",dayChartList.get(0).getDate());
		mav.addObject("startDay", dayChartList.get(12).getDate());
		mav.addObject("dayChart", dayChartList);
		
		// 바 차트에 처음 보여줄 값
		List<AdminMainChartVO> monthChartList = adminMainChartService.getMonthChart(null);
		for(int i=0; i<12; i++) {
//			System.out.println("바차트");
//			System.out.println(i+"번째 date : "+monthChartList.get(i).getDate());
//			System.out.println(i+"번째 sum : "+monthChartList.get(i).getDaySum());
			mav.addObject("month"+i, monthChartList.get(i).getDaySum());
		}
		
		
		mav.setViewName("mainChart");
		return mav;
	}
	
	// 라인차트 +버튼
	@RequestMapping("/next.mdo")
	public ModelAndView nextDay(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("theDay");

		AdminMainChartVO vo = new AdminMainChartVO();
		vo.setDate(str);
		
		List<AdminMainChartVO> dayChartList = adminMainChartService.getDayChart(vo);

		
		mav.addObject("chart", dayChartList);
		mav.setViewName("mainForLine");
		return mav;
	}
	
	// 라인차트 -버튼
	@RequestMapping("/prev.mdo")
	public ModelAndView prevDay(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("theDay");

		AdminMainChartVO vo = new AdminMainChartVO();
		vo.setDate(str);
		
		List<AdminMainChartVO> dayChartList = adminMainChartService.getDayChart2(vo);
		
		
		mav.addObject("chart", dayChartList);
		mav.setViewName("mainForLine");
		return mav;
	}

	// 바 차트 오른쪽 버튼
	@RequestMapping("/nextMonth.mdo")
	public ModelAndView nextMonth(HttpServletRequest request,ModelAndView mav) {
		String str = request.getParameter("setYear");
		System.out.println("오른쪽버튼"+str);
		
		// 바 차트에 처음 보여줄 값
		List<AdminMainChartVO> monthChartList = adminMainChartService.getMonthChart2(null);
//		for(int i=0; i<12; i++) {
//			mav.addObject("month", monthChartList.get(i).getDaySum());
//			System.out.println("2022 가격 : "+monthChartList.get(i).getDaySum());
//		}		
		mav.addObject("month",monthChartList);
		mav.setViewName("mainForBar");
		return mav;
	}
	
	// 바 차트 왼쪽 버튼
	@RequestMapping("/prevMonth.mdo")
	public ModelAndView prevMonth(HttpServletRequest request,ModelAndView mav) {
		String str = request.getParameter("setYear");
		System.out.println(str);
		
		// 바 차트에 처음 보여줄 값
		List<AdminMainChartVO> monthChartList = adminMainChartService.getMonthChart(null);
//		for(int i=0; i<12; i++) {
//			mav.addObject("month", monthChartList.get(i).getDaySum());
//			System.out.println("2021 가격 : "+monthChartList.get(i).getDaySum());
//		}		
		
		mav.addObject("month",monthChartList);
		mav.setViewName("mainForBar");
		return mav;
	}
	
	
	
}
