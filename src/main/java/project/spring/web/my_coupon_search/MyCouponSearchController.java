package project.spring.web.my_coupon_search;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;
import project.spring.web.member.MemberVO;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Controller
public class MyCouponSearchController {
	
	@Autowired
	EventService eventService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	MyPayInfoService myPayInfoService;
	
	@RequestMapping("myCouponSearch.do")
	public ModelAndView myCouponSearchDo(ModelAndView mav, HttpServletRequest request) {
//		String couponName = request.getParameter("couponName");
//		System.out.println(couponName);
//		mav.addObject("couponName",couponName);
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		
		int user_code = mvo.getMemberCode();
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(user_code);
		List<CouponVO> userCoupon = eventService.getCoupon(cvo);
		List<CouponVO> couponDetail = new ArrayList<CouponVO>();
		for(int i = 0; i < userCoupon.size(); i++) {
			int coupon_code = userCoupon.get(i).getCoupon_code();
			CouponVO cvo2 = new CouponVO();
			cvo2.setCoupon_code(coupon_code);
			couponDetail.add(eventService.getCouponDetail(cvo2));
		}
		// 포인트 데이터
		PaymentCompletePointVO vo5 = new PaymentCompletePointVO();
		vo5.setPayment_member_code(mvo.getMemberCode());
		vo5 = paymentCompleteService.getMemberPoint(vo5);
		mav.addObject("point", vo5.getPayment_point());
		
		// 쿠폰 데이터
		CouponVO cvo1 = new CouponVO();
		cvo1.setUser_code(mvo.getMemberCode());
		List<CouponVO> userCoupon1 = eventService.getCoupon(cvo1);
		int check1 = 0;
		for(int i = 0; i < userCoupon1.size(); i++) {
			if(userCoupon1.get(i).getCoupon_check().equals("n")) {
				check1++;
			}
		}
		mav.addObject("couponNum", check1);
		
		// 배송 예정 데이터
		PaymentMyDetailSideInfoVO vo6 = new PaymentMyDetailSideInfoVO();
		vo6.setPayment_member_code(mvo.getMemberCode());
		int check2 = 0;
		List<PaymentMyDetailSideInfoVO> list = myPayInfoService.getMemberAllPaymentInfo(vo6);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getPayment_delivery_condition() == null || !list.get(i).getPayment_delivery_condition().equals("배송완료")) {
				check2++;
			}
		}
		mav.addObject("deliveryNum", check2);
		
		
		mav.addObject("couponDetail",couponDetail);
		mav.setViewName("myCouponSearch");
		return mav;
	}
	
	@RequestMapping(value = "myCouponSearch2.do", method = RequestMethod.POST)
	public ModelAndView myCouponSearch2Do(ModelAndView mav, HttpServletRequest request) {
		String promoCode = request.getParameter("promoCode");
		System.out.println(promoCode);
		mav.addObject("promoCode",promoCode);
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");		
		
		int user_code = mvo.getMemberCode();
		System.out.println(user_code);
		
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(user_code);
		
		List<CouponVO> userCoupon = eventService.getCoupon(cvo);
		List<CouponVO> couponDetail = new ArrayList<CouponVO>();
		for(int i = 0; i < userCoupon.size(); i++) {
			int coupon_code = userCoupon.get(i).getCoupon_code();
			CouponVO cvo2 = new CouponVO();
			cvo2.setCoupon_code(coupon_code);
			couponDetail.add(eventService.getCouponDetail(cvo2));
		}
		mav.addObject("couponDetail",couponDetail);
		mav.setViewName("myCouponSearch");
		
		return mav;
	}
}
