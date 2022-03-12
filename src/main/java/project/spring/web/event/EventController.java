package project.spring.web.event;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		if(mvo != null) {
			int memCode = mvo.getMemberCode();
			CouponVO cvo = new CouponVO();
			cvo.setUser_code(memCode);
			mav.addObject("userCode", memCode);
		}
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
	//신규가입쿠폰팩 한번에 받기 눌렀을때 실행되는 메서드
	@RequestMapping("coupon01.do")
	public ModelAndView coupon01Do(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setCoupon_pack(100);
		
		List<CouponVO> coupon = eventService.getCouponPack(cvo);
		//getCouponPack : SELECT * FROM coupon WHERE coupon_pack = #{coupon_pack}
		CouponVO cvo2 = new CouponVO();
		cvo2.setUser_code(memCode);
		List<CouponVO> userCoupon = eventService.getCoupon(cvo2);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		
		if(coupon.size() == userCoupon.size()) {
			mav.setViewName("downloadCouponModal");
		}else {
			List<CouponVO> addUserCoupon = new ArrayList<CouponVO>();
			for(int i = 0; i < coupon.size(); i++){
				int check = 0;
				for(int j = 0; j < userCoupon.size(); j++){
					if(coupon.get(i).getCoupon_code() != userCoupon.get(j).getCoupon_code()) {
						check++;
					};					
				};
				if(check == userCoupon.size()) {
					CouponVO vo1 = new CouponVO();
					vo1.setUser_code(memCode);
					vo1.setCoupon_code(coupon.get(i).getCoupon_code());
					addUserCoupon.add(vo1);
				};
			};	
			for(int i = 0; i < addUserCoupon.size(); i++){
				CouponVO vo = addUserCoupon.get(i);
				eventService.insertCoupon(vo);
			};		
			mav.setViewName("couponAvailable");		
		}
		return mav;
	}
	
	//신규가입쿠폰팩 낱개로 눌렀을때 실행되는 메서드
	@RequestMapping(value = "coupon02.do", method = RequestMethod.POST)
	public ModelAndView coupon02Do(ModelAndView mav, HttpServletRequest request) {
		CouponVO cvo = new CouponVO();
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		String b = request.getParameter("coupon_code");
		int coupon_code = Integer.parseInt(b);
		System.out.println(memCode);
		System.out.println(coupon_code);
		cvo.setUser_code(memCode);
		
		List<CouponVO> coupon = eventService.getCoupon(cvo);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		
		if(coupon.isEmpty()) {
			CouponVO cvo2 = new CouponVO();
			cvo2.setCoupon_code(coupon_code);
			cvo2.setUser_code(memCode);
			eventService.insertCoupon(cvo2);
			mav.setViewName("couponAvailable");
		} else {
			List<Integer> couponCode = new ArrayList<Integer>();
			for(int i = 0; i < coupon.size(); i++) {
				couponCode.add(coupon.get(i).getCoupon_code());
			}
			if(couponCode.contains(coupon_code)) {
				mav.setViewName("downloadCouponModal");
			} else {
				CouponVO cvo2 = new CouponVO();
				cvo2.setCoupon_code(coupon_code);
				cvo2.setUser_code(memCode);
				eventService.insertCoupon(cvo2);
				mav.setViewName("couponAvailable");
			}
		}
		
		return mav;
	}
	//1만원 쿠폰팩에서 낱개로 눌렀을때 실행되는 메서드
	@RequestMapping(value = "coupon03.do", method = RequestMethod.POST)
	public ModelAndView coupon03Do(ModelAndView mav, HttpServletRequest request) {
		CouponVO cvo = new CouponVO();
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		String b = request.getParameter("coupon_code");
		int coupon_code = Integer.parseInt(b);
		System.out.println(memCode);
		System.out.println(coupon_code);
		cvo.setUser_code(memCode);
		
		List<CouponVO> coupon = eventService.getCoupon(cvo);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		
		if(coupon.isEmpty()) {
			CouponVO cvo2 = new CouponVO();
			cvo2.setCoupon_code(coupon_code);
			cvo2.setUser_code(memCode);
			eventService.insertCoupon(cvo2);
			mav.setViewName("couponAvailable");
		} else {
			List<Integer> couponCode = new ArrayList<Integer>();
			for(int i = 0; i < coupon.size(); i++) {
				couponCode.add(coupon.get(i).getCoupon_code());
			}
			if(couponCode.contains(coupon_code)) {
				mav.setViewName("downloadCouponModal");
			} else {
				CouponVO cvo2 = new CouponVO();
				cvo2.setCoupon_code(coupon_code);
				cvo2.setUser_code(memCode);
				eventService.insertCoupon(cvo2);
				mav.setViewName("couponAvailable");
			}
		}
		
		return mav;
	}
	@RequestMapping("coupon04.do")
	public ModelAndView coupon04Do(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		int memCode = mvo.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setCoupon_pack(200);
		
		List<CouponVO> coupon = eventService.getCouponPack(cvo);
		//getCouponPack : SELECT * FROM coupon WHERE coupon_pack = #{coupon_pack}
		CouponVO cvo2 = new CouponVO();
		cvo2.setUser_code(memCode);
		List<CouponVO> userCoupon = eventService.getCoupon(cvo2);
		//getCoupon : SELECT * FROM user_coupon WHERE user_code = #{user_code}
		
		if(coupon.size() == userCoupon.size()) {
			mav.setViewName("downloadCouponModal");
		}else {
			List<CouponVO> addUserCoupon = new ArrayList<CouponVO>();
			for(int i = 0; i < coupon.size(); i++){
				int check = 0;
				for(int j = 0; j < userCoupon.size(); j++){
					if(coupon.get(i).getCoupon_code() != userCoupon.get(j).getCoupon_code()) {
						check++;
					};					
				};
				if(check == userCoupon.size()) {
					CouponVO vo1 = new CouponVO();
					vo1.setUser_code(memCode);
					vo1.setCoupon_code(coupon.get(i).getCoupon_code());
					addUserCoupon.add(vo1);
				};
			};	
			for(int i = 0; i < addUserCoupon.size(); i++){
				CouponVO vo = addUserCoupon.get(i);
				eventService.insertCoupon(vo);
			};		
			mav.setViewName("couponAvailable");		
		}
		return mav;
	}
	
}
