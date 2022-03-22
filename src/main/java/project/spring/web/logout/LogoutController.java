package project.spring.web.logout;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	
	@RequestMapping("/logout.do")
	public ModelAndView logoutDo(ModelAndView mav, HttpServletRequest request) {
		mav.setViewName("logoutModal");
		return mav;
	}
	
	@RequestMapping("/logoutConfirm.do")
	public ModelAndView logoutConfirmDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.invalidate();
		mav.setViewName("index");
		return mav;
	}
}
