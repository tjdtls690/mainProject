package project.spring.web.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/login.do")
	public ModelAndView loginDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("memberType");
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/googleLogin.do")
	public ModelAndView googleLoginDo(MemberVO vo, HttpServletRequest request, ModelAndView mav) {
		System.out.println("googleLoginDo 실행");
		HttpSession session = request.getSession();
		int emailCheck = memberService.checkEmail(vo);
		if(emailCheck == 1) {
			session.removeAttribute("member");
			session.setAttribute("member", memberService.getMember(vo));
			mav.setViewName("main");
		}else {
			session.removeAttribute("member");
			session.setAttribute("member", vo);
			mav.addObject("memberType", "g");
			mav.setViewName("signupWrite");
		}
		return mav;
	}
	
	@RequestMapping("/kakaoLogin.do")
	public ModelAndView kakaoLoginDo(ModelAndView mav) {
		System.out.println("kakaoLoginDo 실행");
		mav.setViewName("kakaoLogin");
		return mav;
	}
	
	@RequestMapping("/kakaoData.do")
	public ModelAndView kakaoDataDo(MemberVO vo, HttpServletRequest request, ModelAndView mav) {
		System.out.println("kakaoDataDo 실행");
		HttpSession session = request.getSession();
		int emailCheck = memberService.checkEmail(vo);
		if(emailCheck == 1) {
			session.removeAttribute("member");
			session.setAttribute("member", memberService.getMember(vo));
			mav.setViewName("main");
		}else {
			mav.addObject("memberType", "k");
			session.removeAttribute("member");
			session.setAttribute("member", vo);
			mav.setViewName("signupWrite");
		}
//		String string = "1993-07-12";
//        LocalDate date = LocalDate.parse(string, DateTimeFormatter.ISO_DATE);
//		vo.setBirthday(date);
//		System.out.println(vo.getBirthday());
		return mav;
	}
}
