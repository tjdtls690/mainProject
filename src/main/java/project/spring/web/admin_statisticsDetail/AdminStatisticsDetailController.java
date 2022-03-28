package project.spring.web.admin_statisticsDetail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.admin_statisticsDetailImpl.AdminStatisticsDetailDAO;

@Controller
public class AdminStatisticsDetailController {
	@Autowired
	AdminStatisticsDetailService adminStatisticsDetailVOService;
	
	
	@RequestMapping("/pieChart.mdo")
	public ModelAndView pieChart(ModelAndView mav){
	
		List<AdminStatisticsDetailVO> list = adminStatisticsDetailVOService.getHowManyDetault(null);
		for(int i=0; i < list.size(); i++) {
//			System.out.println(i+"번째 태그메인 : "+ list.get(i).getTagMain()+" test : "+ list.get(i).getCount());
			mav.addObject("tagMain"+i,list.get(i).getCount());
		}
		List<AdminStatisticsDetailVO> list2 = adminStatisticsDetailVOService.getSummary(null);
		mav.addObject("list2",list2);

		mav.setViewName("pieChart");
		return mav;	
	}
	
	@RequestMapping("/salesRank.mdo")
	public ModelAndView saleRank(ModelAndView mav, HttpServletRequest request) {
		//System.out.println("salesRank 접근");
		String str = request.getParameter("getTagMain");
		int tagMain = Integer.parseInt(str);
		System.out.println("얻은 tagMain : "+tagMain);
		
		if(tagMain != 1000) {
			AdminStatisticsDetailVO vo = new AdminStatisticsDetailVO();
			vo.setTagMain(tagMain);
			
			// 수량으로 랭크 10
			List<AdminStatisticsDetailVO> list = adminStatisticsDetailVOService.getTagMainRank(vo);
			mav.addObject("list",list);
			
			// 판매액으로 랭크 10
			List<AdminStatisticsDetailVO> list2 = adminStatisticsDetailVOService.getTagMainRank2(vo);
			mav.addObject("list2",list2);
		}else { // 1000일때
			System.out.println("1000일때");
			List<AdminStatisticsDetailVO> list = adminStatisticsDetailVOService.getSummary(null);
			mav.addObject("list",list);
			
//			for(int i=0; i<list.size(); i++) {
//				System.out.println("tagMain : "+list.get(i).getTagMain()+" count : "+list.get(i).getCount()+" prcie : "+list.get(i).getSum());
//			}
			
			List<AdminStatisticsDetailVO> list2 = adminStatisticsDetailVOService.getHowManyDetault(null);
			mav.addObject("list2",list2);
		}
		
		

		mav.addObject("tagMain",tagMain);
		mav.setViewName("salesStatisticsRank");
		return mav;
	}

}
