package project.spring.web.adminLogin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminLoginController {
	
	
	@RequestMapping("/adminLogin.mdo")
	public ModelAndView adminLoginDo(ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}
}
