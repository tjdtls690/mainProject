package project.spring.web.my_pay_detail_info;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;
import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;
import project.spring.web.member.MemberVO;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Controller
public class MyPayDetailInfoController {
	
	@Autowired
	MyPayDetailInfoService myPayDetailInfoService;
	@Autowired
	DetailService detailService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	EventService eventService;
	@Autowired
	MyPayInfoService myPayInfoService;
	
	
	@RequestMapping("/myPayDetailInfo.do")
	public ModelAndView myPayDetailDo(ModelAndView mav, PaymentMyDetailSideInfoVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		
		vo = myPayDetailInfoService.getMemberPaymentDetailInfo(vo);
		
		PaymentMyDetailInfoVO vo1 = new PaymentMyDetailInfoVO();
		vo1.setPayment_code(vo.getPayment_code());
		List<PaymentMyDetailInfoVO> list1 = myPayDetailInfoService.getMemberPayMappingItemInfo(vo1);
		List<DetailVO> list2 = new ArrayList<DetailVO>();
		
		for(int i = 0; i < list1.size(); i++) {
			DetailVO vo2 = new DetailVO();
			vo2.setItem_code(list1.get(i).getPayment_item_mapping_item_code());
			
			if(list1.get(i).getPayment_item_mapping_tag_main() == 100 || list1.get(i).getPayment_item_mapping_tag_main() == 600) {
				list2.add(detailService.getSubItem(vo2));
			}else {
				list2.add(detailService.getItem(vo2));
			}
		}
		// 포인트 데이터
		PaymentCompletePointVO vo5 = new PaymentCompletePointVO();
		vo5.setPayment_member_code(mvo.getMemberCode());
		vo5 = paymentCompleteService.getMemberPoint(vo5);
		mav.addObject("point", vo5.getPayment_point());
		
		// 쿠폰 데이터
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(mvo.getMemberCode());
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
		vo6.setPayment_member_code(mvo.getMemberCode());
		int check2 = 0;
		List<PaymentMyDetailSideInfoVO> list = myPayInfoService.getMemberAllPaymentInfo(vo6);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getPayment_delivery_condition() == null || !list.get(i).getPayment_delivery_condition().equals("배송완료")) {
				check2++;
			}
		}
		mav.addObject("deliveryNum", check2);
		
		
		mav.addObject("vo", vo);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.setViewName("myPayDetailInfo");
		return mav;
	}
}
