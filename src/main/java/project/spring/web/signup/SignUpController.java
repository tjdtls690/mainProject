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
	
	@RequestMapping("/emailCheck.do")
	public ModelAndView emailCheckDo(ModelAndView mav, HttpServletRequest request) {
		String pattern = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
		String email = request.getParameter("email");
		System.out.println(email);
		if(Pattern.matches(pattern, email)) {
			mav.addObject("check", 1);
		} else {
			mav.addObject("check", 0);
		}
		mav.setViewName("emailCheck");
		return mav;
	}
	
	@RequestMapping(value = "/phoneBeforeCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String phoneBeforeCheckDo(String phone) {
		String regExp = "^01(?:0|1|[6-9])(\\d{3}|\\d{4})(\\d{4})$";
		if(phone.matches(regExp) == true) {
			return "1";
		}
		return "0";
	}
	
	@RequestMapping("/phoneCheck.do")
	public ModelAndView phoneCheckDo(ModelAndView mav) {
		mav.setViewName("phoneCheck");
		return mav;
	}
	
	@RequestMapping("/checkBox.do")
	public ModelAndView checkBoxDo(ModelAndView mav) {
		mav.setViewName("checkBox");
		return mav;
	}
	
	@RequestMapping("/detailModal01.do")
	public ModelAndView detailModal01Do(ModelAndView mav) {
		mav.setViewName("detailModal01");
		return mav;
	}
	
	@RequestMapping("/detailModal02.do")
	public ModelAndView detailModal02Do(ModelAndView mav) {
		mav.setViewName("detailModal02");
		return mav;
	}
}
