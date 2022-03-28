package project.spring.web.admin_statistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.admin_statisticsDetail.AdminStatisticsDetailService;
import project.spring.web.admin_statisticsDetail.AdminStatisticsDetailVO;
import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;

@Controller
public class AdminStatisticsController {
	
	@Autowired
	AdminStatisticsService adminStatisticsService;
	@Autowired
	AdminStatisticsDetailService adminStatisticsDetailService;
	@Autowired
	DetailService detailService;
	
	@RequestMapping("/getMonthList.mdo")
	public ModelAndView monthList(HttpServletRequest request,ModelAndView mav) {
		String getMonth = request.getParameter("getMonth");
		char month =getMonth.charAt(3);
		System.out.println("가져올 월 : "+month);
		
		
		if(month =='1') {
			System.out.println("1개월임");
			
			List<AdminStatisticsVO> listMonth = adminStatisticsService.getMonth(null);
			
//			for(int i=0; i<listMonth.size(); i++) {
//				System.out.println(i+"번째 날짜 : " + listMonth.get(i).getPayment_date());
//				System.out.println(i+"번째 가격 : " + listMonth.get(i).getPayment_final_price());
//			}
			mav.addObject("listMonth",listMonth);
			
			mav.setViewName("salesStatisticsMonth");
			
			
		}else if(month =='3') {
			System.out.println("3개월임");
			
			List<AdminStatisticsVO> listMonth3 = adminStatisticsService.getMonth3(null);

//			for(int i=0; i<listMonth3.size(); i++) {
//				System.out.println(i+"번째 날짜 : " + listMonth3.get(i).getPayment_date());
//				System.out.println(i+"번째 가격 : " + listMonth3.get(i).getPayment_final_price());
//			}
			mav.addObject("listMonth",listMonth3);
			
			mav.setViewName("salesStatisticsMonth");
			
			
			
		}else {
			System.out.println("6개월임");
			
			List<AdminStatisticsVO> listMonth6 = adminStatisticsService.getMonth6(null);

			for(int i=0; i<listMonth6.size(); i++) {
				System.out.println(i+"번째 날짜 : " + listMonth6.get(i).getPayment_date());
				System.out.println(i+"번째 가격 : " + listMonth6.get(i).getPayment_final_price());
			}
			mav.addObject("listMonth",listMonth6);
			
			mav.setViewName("salesStatisticsMonth");
			
		}
		
		
		return mav;
	}
	
	// 상세 검색에서 리스트 보여주기
	@RequestMapping("/getItemList.mdo")
	public ModelAndView getItemList(ModelAndView mav, HttpServletRequest request) {
		String str = request.getParameter("tagMain");
		int getTagMain = Integer.parseInt(str);		
		
		DetailVO vo = new DetailVO();
		vo.setItem_tag_main(getTagMain);
		if(getTagMain == 100 || getTagMain == 600) {// 구독/세트 일때
			
			List<DetailVO> list = detailService.getTagSubscribe(vo);
			mav.addObject("list",list);	
//			for(int i =0; i<list.size(); i++) {
//				System.out.println("아이템 코드 : "+ list.get(i).getItem_code());
//			}
			
		}else {	//단품일때
			
			List<DetailVO> list = detailService.getTagItem(vo);
			mav.addObject("list",list);
//			for(int i =0; i<list.size(); i++) {
//				System.out.println("아이템 코드 : "+ list.get(i).getItem_code());
//			}
			
		}
		
		mav.setViewName("saleStatisticsTag");
		return mav;	
	}
	
	// 상세 검색시 나올것들
	@RequestMapping("/getDetailList.mdo")
	public ModelAndView getDetailList(ModelAndView mav,HttpServletRequest request) {
		System.out.println("getDetailList.mdo 진입");
		
		String str = request.getParameter("tagMain");
		int tagMain = Integer.parseInt(str);
		String str2 = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(str2);
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		//System.out.println("태그메인 : "+tagMain+"아이템 코드 : "+itemCode+" 시작일 : "+start+" 마지막일 : "+end);
		
		
		if(tagMain == 100 || tagMain == 600) {// 구독/세트 일때
			
			AdminStatisticsDetailVO vo = new AdminStatisticsDetailVO();
			vo.setCode(itemCode);
			vo.setTagMain(tagMain);
			vo.setStart(start);
			vo.setEnd(end);
			List<AdminStatisticsDetailVO> list = adminStatisticsDetailService.getSetReportDetail(vo);
			mav.addObject("list",list);	
//			for(int i =0; i<list.size(); i++) {
//				System.out.println("아이템 코드 : "+ list.get(i).getItem_code());
//			}
			mav.setViewName("salesStatisticsDetail");
			
		}else {	//단품일때
			
			AdminStatisticsDetailVO vo = new AdminStatisticsDetailVO();
			vo.setCode(itemCode);
			vo.setTagMain(tagMain);
			vo.setStart(start);
			vo.setEnd(end);
			List<AdminStatisticsDetailVO> list = adminStatisticsDetailService.getItemReportDetail(vo);
			mav.addObject("list",list);
//			for(int i =0; i<list.size(); i++) {
//				System.out.println("아이템 코드 : "+ list.get(i).getDate());
//			}
			mav.setViewName("salesStatisticsDetail");
			
		}
		
		return mav;
	}
	

}
