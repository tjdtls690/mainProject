package project.spring.web.my_point_search;

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
import project.spring.web.point_history.PointHistoryService;
import project.spring.web.point_history.PointHistoryVO;

@Controller
public class MyPointSearchController {
	
	@Autowired
	PointHistoryService pointHistoryService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	EventService eventService;
	@Autowired
	MyPayInfoService myPayInfoService;
	
	@RequestMapping("myPointSearch.do")
	public ModelAndView myPointSearchDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		// 포인트 조회 데이터
		PointHistoryVO vo1 = new PointHistoryVO();
		vo1.setPoint_history_member_code(vo.getMemberCode());
		List<PointHistoryVO> list = pointHistoryService.selectMemberPointHistory(vo1);
		
		// 포인트 전체 합산 데이터
		PaymentCompletePointVO vo2 = new PaymentCompletePointVO();
		vo2.setPayment_member_code(vo.getMemberCode());
		vo2 = paymentCompleteService.getMemberPoint(vo2);
		
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
				List<PaymentMyDetailSideInfoVO> list1 = myPayInfoService.getMemberAllPaymentInfo(vo6);
				for(int i = 0; i < list1.size(); i++) {
					if(list1.get(i).getPayment_delivery_condition() == null || !list1.get(i).getPayment_delivery_condition().equals("배송완료")) {
						check2++;
					}
				}
				mav.addObject("deliveryNum", check2);
		
		mav.addObject("vo", vo2);
		mav.addObject("list", list);
		mav.setViewName("myPointSearch");
		return mav;
	}
}
