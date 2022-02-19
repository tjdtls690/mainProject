package project.spring.web.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("/googleLogin.do")
	public ModelAndView googleLoginDo(HttpServletRequest request, ModelAndView mav) {
		System.out.println("googleLoginDo 실행");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println(name + " " + email);
		HttpSession session = request.getSession();
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/kakaoLogin.do")
	public ModelAndView kakaoLoginDo(ModelAndView mav) {
		System.out.println("kakaoLoginDo 실행");
		mav.setViewName("kakaoLogin");
		return mav;
	}
	
	@RequestMapping("/kakaoData.do")
	public ModelAndView kakaoDataDo(HttpServletRequest request, ModelAndView mav) {
		System.out.println("kakaoDataDo 실행");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		System.out.println(name + " " + email + " " + gender + " " + birthday);
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		session.setAttribute("gender", gender);
		session.setAttribute("birthday", birthday);
		mav.setViewName("main");
		return mav;
	}
	
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
