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
	
}
