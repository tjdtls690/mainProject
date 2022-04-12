package project.spring.web.admin_main_chart;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.admin_main.report.day.AdminReportDayService;
import project.spring.web.admin_main.report.day.AdminReportDayVO;
import project.spring.web.admin_main_rank.AdminMainRankService;
import project.spring.web.admin_main_rank.AdminMainRankVO;

@Controller
public class AdminMainChartController {
	
	@Autowired
	private AdminMainChartService adminMainChartService;
	@Autowired
	private AdminReportDayService adminReportDayService;
	@Autowired
	private AdminMainRankService adminMainRankService;
	
	@RequestMapping("/adminMainChart.mdo")
	public ModelAndView adminMainChartDo(ModelAndView mav) {
		// 날짜용 매서드
		LocalDate now = LocalDate.now();
		DecimalFormat df = new DecimalFormat("00");
        Calendar currentCalendar = Calendar.getInstance();

        // 이번 년도	--> 2022
        int year = now.getYear();
        //이번달		--> 03
      	String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
      	System.out.println("이번달 : "+month);
      	// 오늘 날짜만 --> 23
        int thisDay = now.getDayOfMonth();
        // 이번 년도 + 이번달 + 오늘
        String today = year+"-"+month+"-"+thisDay;
        //System.out.println("오늘은!? : "+today);
        mav.addObject("today",today);
        
// 메인페이지 처음에 보여줄 날짜 셋팅.
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");        
        for(int i=0; i<13; i++) {
        	currentCalendar.add(Calendar.DAY_OF_MONTH,+1);
        	System.out.println(i+"번째 : "+format.format(currentCalendar.getTime()));
        	mav.addObject("thisDay"+i,format.format(currentCalendar.getTime()));
        }
        
        // 테스트
       
        
		// 이번주 첫째날
        currentCalendar.add(Calendar.DATE, -12 - currentCalendar.get(Calendar.DAY_OF_WEEK));
        String firstWeekDay = df.format(currentCalendar.get(Calendar.DATE));    
	    System.out.println("이번주 시작일 " + firstWeekDay);
	    // 이번주 마지막날
	    currentCalendar.add(Calendar.DATE, 8 - currentCalendar.get(Calendar.DAY_OF_WEEK)); 
        String lastWeekDay = df.format(currentCalendar.get(Calendar.DATE)); 
        System.out.println("이번주 마지막일 " + lastWeekDay);
        // 이번주의 첫째날 
        String thisWeek = year+"-"+month+"-"+lastWeekDay;
		
// 처음 시작시 input에 시작 날짜 넣기 . 라인차트 값넣기		
		AdminMainChartVO vo = new AdminMainChartVO();
		vo.setDate(today);
		List<AdminMainChartVO> dayChartList = adminMainChartService.dayChart(vo);

		//	값이 잘 넘어오는지 테스트
		for(int i=0; i<13; i++) {
//			System.out.println("라인차트");
//			System.out.print(i+" 번째 date :  "+dayChartList.get(i).getDate());
//			System.out.println();
//			System.out.print(i+" 번째 sum : "+dayChartList.get(i).getDaySum ());
			
			mav.addObject("check"+i, dayChartList.get(i).getDaySum());
			mav.addObject("checkk"+i, dayChartList.get(i).getDate());
		}
		mav.addObject("startDay2",dayChartList.get(0).getDate());
		mav.addObject("startDay", dayChartList.get(12).getDate());
		mav.addObject("dayChart", dayChartList);
		
// 금주 매출 보여주기 모달창에 값넣기.
		
		AdminReportDayVO vo2 = new AdminReportDayVO();
		vo2.setDate(thisWeek);
		System.out.println("시작일 "+thisWeek);
		List<AdminReportDayVO> list2 = adminReportDayService.reportDay(vo2);
		mav.addObject("modal",list2);
		
// 금달 매출 보여주기 모달창에 값넣기
		
		// 이번달 시작일
		String startDay = year+"-"+month+"-"+"01";
		//System.out.println("시작일 : "+startDay);
		// 이번달 마지막일
		int str = currentCalendar.getActualMaximum(Calendar.DAY_OF_MONTH)+1;
		System.out.println("이번달 마지막 일 : "+str);
		String endDay = year+"-"+month+"-"+str;
		//System.out.println("마지막날 : "+endDay);
		AdminReportDayVO vo3 = new AdminReportDayVO();
		vo3.setDate(startDay);
		vo3.setImpl(endDay);
		
		List<AdminReportDayVO> list3 = adminReportDayService.reportMonth(vo3);
        mav.addObject("modalMonth",list3);

		

// 바 차트에 처음 보여줄 값
		List<AdminMainChartVO> monthChartList = adminMainChartService.getMonthChart(null);
		for(int i=0; i<12; i++) {
//			System.out.println("바차트");
//			System.out.println(i+"번째 date : "+monthChartList.get(i).getDate());
//			System.out.println(i+"번째 sum : "+monthChartList.get(i).getDaySum());
			mav.addObject("month"+i, monthChartList.get(i).getDaySum());
		}
		
// 판매량 랭킹 top 10 차트
		List<AdminMainRankVO> rankList = adminMainRankService.countRank10();
		mav.addObject("rankList",rankList);
		
		
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
	

	@RequestMapping("/thisWeek.mdo")
	public ModelAndView thisWeek(HttpServletRequest request, ModelAndView mav) {
		System.out.println("thisWeek 들어옴");
		mav.setViewName("mainTableWeekModal");
		return mav;
	}
	


	
	
	
}
