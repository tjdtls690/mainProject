package project.spring.web.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping("/login.do")
	public ModelAndView loginDo(ModelAndView mav) {
		mav.setViewName("login");
		return mav;
	}
}
