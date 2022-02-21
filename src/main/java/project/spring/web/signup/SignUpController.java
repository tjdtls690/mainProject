package project.spring.web.signup;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value = "/emailCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String emailCheckDo(HttpServletRequest request) {
		String pattern = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
		String email = request.getParameter("email");
		System.out.println(email);
		if(Pattern.matches(pattern, email)) {
		  return "사용할 수 있는 이메일 주소입니다. ";
		} else {            
		  return "이메일 형식이 올바르지 않습니다. ";
		}
	}
}
