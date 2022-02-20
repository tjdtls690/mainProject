package project.spring.web.signup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SignUpController {
	
	
	@RequestMapping("/signup.do")
	public ModelAndView signUpDo(ModelAndView mav) {
		mav.setViewName("signup");
		return mav;
	}
	
	@RequestMapping("/signupWrite.do")
	public ModelAndView signupWriteDo(ModelAndView mav) {
		mav.setViewName("signupWrite");
		return mav;
	}
}
