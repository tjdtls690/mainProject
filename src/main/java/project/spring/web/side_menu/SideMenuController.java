package project.spring.web.side_menu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;
import project.spring.web.member.MemberVO;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Controller
public class SideMenuController {
	
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	EventService eventService;
	@Autowired
	MyPayInfoService myPayInfoService;
	
	@RequestMapping("/sideMune.do")
	public ModelAndView sideMunuDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		if(vo == null) {
			mav.addObject("check", 0);
		}else {
			// 포인트 데이터
			PaymentCompletePointVO vo5 = new PaymentCompletePointVO();
			vo5.setPayment_member_code(vo.getMemberCode());
			vo5 = paymentCompleteService.getMemberPoint(vo5);
			mav.addObject("point", vo5.getPayment_point());
			
			// 쿠폰 데이터
			CouponVO cvo = new CouponVO();
			cvo.setUser_code(vo.getMemberCode());
			List<CouponVO> userCoupon = eventService.getCoupon(cvo);
			int check1 = 0;
			for(int i = 0; i < userCoupon.size(); i++) {
				if(userCoupon.get(i).getCoupon_check().equals("n")) {
					check1++;
				}
			}
			mav.addObject("couponNum", check1);
			
			// 배송 예정 데이터
			PaymentMyDetailSideInfoVO vo6 = new PaymentMyDetailSideInfoVO();
			vo6.setPayment_member_code(vo.getMemberCode());
			int check2 = 0;
			List<PaymentMyDetailSideInfoVO> list = myPayInfoService.getMemberAllPaymentInfo(vo6);
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getPayment_delivery_condition() == null || !list.get(i).getPayment_delivery_condition().equals("배송완료")) {
					check2++;
				}
			}
			mav.addObject("deliveryNum", check2);
			
			mav.addObject("check", 1);
			mav.addObject("member", vo);
		}
		
		mav.setViewName("sideMenu");
		return mav;
	}
}
