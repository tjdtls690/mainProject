package project.spring.web.admin_salesManagement;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SalesManagemnetController {
	
	@RequestMapping("/salesManagement.mdo")
	public ModelAndView salesManageMent(ModelAndView mav) {
		
		mav.setViewName("salesManagement");
		return mav;	
	}
	
	@RequestMapping("/getMonthList.mdo")
	public ModelAndView monthList(HttpServletRequest request,ModelAndView mav) {
		String getMonth = request.getParameter("getMonth");
		char month =getMonth.charAt(3);
		System.out.println("가져올 월 : "+month);
		
		
		if(month =='1') {
			System.out.println("1개월임");
			
			
		}else if(month =='3') {
			System.out.println("3개월임");
			
			
		}else {
			System.out.println("6개월임");
			
			
		}
		
		
		return mav;
	}
	
	
	
	
	
}
