package project.spring.web.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("/main.do")
	public ModelAndView mainDo(ModelAndView mav) {
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/test01.do")
	public ModelAndView test01Do(HttpServletRequest request, ModelAndView mav) {
		String a = request.getParameter("tagMain01");
		String b = request.getParameter("itemCode01");
		System.out.println(a + " " + b);
		mav.setViewName("main");
		return mav;
	}

}
