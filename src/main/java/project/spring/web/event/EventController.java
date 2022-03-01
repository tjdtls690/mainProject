package project.spring.web.event;

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
	public ModelAndView firstEventDo(ModelAndView mav) {
		MemberVO vo = new MemberVO();
		vo.setMemberCode(1);
		mav.addObject("member", memberService.getMember(vo));
		
		CouponVO cvo = new CouponVO();
		mav.addObject("coupon", eventService.getCoupon(cvo));
		mav.setViewName("firstEvent");
		return mav;
	}
	
	@RequestMapping("secondEvent.do")
	public ModelAndView secondEventDo(ModelAndView mav) {
		mav.setViewName("secondEvent");
		return mav;
	}
	
}
