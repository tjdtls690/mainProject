package project.spring.web.event;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member.MemberService;
import project.spring.web.member.MemberVO;

@Controller
public class EventController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	EventService eventService;
	
	@RequestMapping("event.do")
	public ModelAndView eventDo(ModelAndView mav) {
		mav.setViewName("event");
		return mav;
	}
	
	@RequestMapping("firstEvent.do")
	public ModelAndView firstEventDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(memCode);
		mav.addObject("userCode", memCode);
		mav.setViewName("firstEvent");
		return mav;
	}
	
	@RequestMapping("secondEvent.do")
	public ModelAndView secondEventDo(ModelAndView mav) {
		mav.setViewName("secondEvent");
		return mav;
	}
	
	@RequestMapping("fourthEvent.do")
	public ModelAndView fourthEventDo(ModelAndView mav) {
		mav.setViewName("fourthEvent");
		return mav;
	}
	
	@RequestMapping("fifthEvent.do")
	public ModelAndView fifthEventDo(ModelAndView mav) {
		mav.setViewName("fifthEvent");
		return mav;
	}
	
	@RequestMapping("coupon01.do")
	public ModelAndView coupon01Do(ModelAndView mav) {
		mav.setViewName("couponModal");
		return mav;
	}
	
	@RequestMapping("coupon02.do")
	public ModelAndView coupon02Do(ModelAndView mav, HttpServletRequest request) {
		CouponVO cvo = new CouponVO();
		String a = request.getParameter("userCode");
		String b = request.getParameter("coupon_code");
		int user_code = Integer.parseInt(a);
		int coupon_code = Integer.parseInt(b);
		System.out.println(user_code);
		System.out.println(coupon_code);
		cvo.setUser_code(user_code);
		List<CouponVO> arr = eventService.getCoupon(cvo);
		for(int i = 0; i < arr.size(); i++) {
			System.out.println(arr.get(i).getCoupon_code());
			if(arr.get(i).getCoupon_code() == coupon_code) {
				mav.setViewName("downloadCouponModal");
				return mav;
			} else {
				CouponVO cvo2 = new CouponVO();
				cvo2.setCoupon_code(coupon_code);
				cvo2.setUser_code(user_code);
				eventService.insertCoupon(cvo2);
				mav.setViewName("couponAvailable");
				return mav;
			}
		}
		return mav;
	}
}
