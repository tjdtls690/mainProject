package project.spring.web.my_review_search;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;
import project.spring.web.event.CouponVO;
import project.spring.web.event.EventService;
import project.spring.web.member.MemberVO;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.my_review_write.MyReviewWriteService;
import project.spring.web.my_review_write.MyReviewWriteVO;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;
import project.spring.web.paymentSingle.PaymentSingleService;
import project.spring.web.point_history.PointHistoryService;
import project.spring.web.point_history.PointHistoryVO;

@Controller
public class MyReviewSearchController {
	
	@Autowired
	MyPayInfoService myPayInfoService;
	@Autowired
	DetailService detailService;
	@Autowired
	MyReviewSearchService myReviewSearchService;
	@Autowired
	PaymentCompleteService paymentCompleteService;
	@Autowired
	PaymentSingleService paymentSingleService;
	@Autowired
	MyReviewWriteService myReviewWriteService;
	@Autowired
	PointHistoryService pointHistoryService;
	@Autowired
	EventService eventService;
	
	@RequestMapping("/myReviewSearch.do")
	public ModelAndView myReviewSearchDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		
		PaymentMyDetailSideInfoVO vo2 = new PaymentMyDetailSideInfoVO();
		vo2.setPayment_member_code(vo1.getMemberCode());
		List<PaymentMyDetailSideInfoVO> list1 = myPayInfoService.getMemberAllPaymentInfo(vo2);
		List<List<PaymentMyDetailInfoVO>> list2 = new ArrayList<List<PaymentMyDetailInfoVO>>();
		List<List<DetailVO>> list4 = new ArrayList<List<DetailVO>>();
		for(int i = 0; i < list1.size(); i++) {
			PaymentMyDetailInfoVO vo3 = new PaymentMyDetailInfoVO();
			vo3.setPayment_code(list1.get(i).getPayment_code());
			List<PaymentMyDetailInfoVO> list3 = myPayInfoService.getMemberPayMappingItemInfo(vo3);
			list2.add(list3);
		}
		
		for(int i = 0; i < list2.size(); i++) {
			List<DetailVO> list5 = new ArrayList<DetailVO>();
			for(int j = 0; j < list2.get(i).size(); j++) {
				DetailVO vo4 = new DetailVO();
				vo4.setItem_code(list2.get(i).get(j).getPayment_item_mapping_item_code());
				if(list2.get(i).get(j).getPayment_item_mapping_tag_main() != 100 && list2.get(i).get(j).getPayment_item_mapping_tag_main() != 600) {
					list5.add(detailService.getItem(vo4));
				}else {
					list5.add(detailService.getSubItem(vo4));
				}
			}
			
			list4.add(list5);
		}
		int check = 0;
		for(int i = 0; i < list2.size(); i++) {
			for(int j = 0; j < list2.get(i).size(); j++) {
				if(list2.get(i).get(j).getPayment_item_mapping_review() == 0) {
					check++;
				}
			}
		}
		
		// 포인트 데이터
		PaymentCompletePointVO vo5 = new PaymentCompletePointVO();
		vo5.setPayment_member_code(vo1.getMemberCode());
		vo5 = paymentCompleteService.getMemberPoint(vo5);
		mav.addObject("point", vo5.getPayment_point());
		
		// 쿠폰 데이터
		CouponVO cvo = new CouponVO();
		cvo.setUser_code(vo1.getMemberCode());
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
		vo6.setPayment_member_code(vo1.getMemberCode());
		int check2 = 0;
		List<PaymentMyDetailSideInfoVO> list = myPayInfoService.getMemberAllPaymentInfo(vo6);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getPayment_delivery_condition() == null || list.get(i).getPayment_delivery_condition().equals("배송중")) {
				check2++;
			}
		}
		mav.addObject("deliveryNum", check2);
		
		
		mav.addObject("check", check);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list4);
		mav.setViewName("myReviewSearch");
		return mav;
	}
	
	@RequestMapping("/myReviewSearchWriteReviewTab.do")
	public ModelAndView myReviewSearchWriteReviewTabDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		
		PaymentMyDetailSideInfoVO vo2 = new PaymentMyDetailSideInfoVO();
		vo2.setPayment_member_code(vo1.getMemberCode());
		List<PaymentMyDetailSideInfoVO> list1 = myPayInfoService.getMemberAllPaymentInfo(vo2);
		List<List<PaymentMyDetailInfoVO>> list2 = new ArrayList<List<PaymentMyDetailInfoVO>>();
		List<List<DetailVO>> list4 = new ArrayList<List<DetailVO>>();
		for(int i = 0; i < list1.size(); i++) {
			PaymentMyDetailInfoVO vo3 = new PaymentMyDetailInfoVO();
			vo3.setPayment_code(list1.get(i).getPayment_code());
			List<PaymentMyDetailInfoVO> list3 = myPayInfoService.getMemberPayMappingItemInfo(vo3);
			list2.add(list3);
		}
		
		for(int i = 0; i < list2.size(); i++) {
			List<DetailVO> list5 = new ArrayList<DetailVO>();
			for(int j = 0; j < list2.get(i).size(); j++) {
				DetailVO vo4 = new DetailVO();
				vo4.setItem_code(list2.get(i).get(j).getPayment_item_mapping_item_code());
				if(list2.get(i).get(j).getPayment_item_mapping_tag_main() != 100 && list2.get(i).get(j).getPayment_item_mapping_tag_main() != 600) {
					list5.add(detailService.getItem(vo4));
				}else {
					list5.add(detailService.getSubItem(vo4));
				}
			}
			
			list4.add(list5);
		}
		
		int check = 0;
		for(int i = 0; i < list2.size(); i++) {
			for(int j = 0; j < list2.get(i).size(); j++) {
				if(list2.get(i).get(j).getPayment_item_mapping_review() == 0) {
					check++;
				}
			}
		}
		
		
		mav.addObject("check", check);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list4);
		mav.setViewName("myReviewSearchWriteReviewTab");
		return mav;
	}
	
	@RequestMapping("/myReviewSearchWriteCompleteReviewTab.do")
	public ModelAndView myReviewSearchWriteCompleteReviewTabDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		List<MyReviewWriteVO> list2 = new ArrayList<MyReviewWriteVO>();
		
		PaymentMyDetailInfoVO vo2 = new PaymentMyDetailInfoVO();
		vo2.setPayment_member_code(vo1.getMemberCode());
		List<PaymentMyDetailInfoVO> list1 = paymentCompleteService.getMemberPayMappingMemberCodeInfo(vo2);
		
		for(int i = 0; i < list1.size(); i++) {
			MyReviewWriteVO vo3 = new MyReviewWriteVO();
			vo3.setPayment_item_mapping_code(list1.get(i).getPayment_item_mapping_code());
			list2.add(myReviewSearchService.getPaymentItemMappingCodeReview(vo3));
		}
		
		int check = 0;
		for(int i = 0; i < list1.size(); i++) {
			MyReviewWriteVO vo3 = new MyReviewWriteVO();
			vo3.setPayment_item_mapping_code(list1.get(i).getPayment_item_mapping_code());
			if(list1.get(i).getPayment_item_mapping_review() == 1 && myReviewSearchService.getPaymentItemMappingCodeReview(vo3) != null) {
				check++;
			}
		}
		
		mav.addObject("check", check);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.setViewName("myReviewSearchWriteCompleteReviewTab");
		return mav;
	}
	
	
	@RequestMapping(value = "/mySearchReviewDelete.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String mySearchReviewDeleteDo(ModelAndView mav, HttpServletRequest request, PaymentMyDetailInfoVO vo, MyReviewWriteVO vo1) {
		HttpSession session = request.getSession();
		MemberVO vo2 = (MemberVO)session.getAttribute("member");
		
		vo1 = myReviewWriteService.getReview(vo1);
		PaymentCompletePointVO pointTmpVO = new PaymentCompletePointVO();
		PointHistoryVO pointHistoryVO = new PointHistoryVO();
		pointTmpVO.setPayment_member_code(vo2.getMemberCode());
		pointHistoryVO.setPoint_history_member_code(vo2.getMemberCode());
		
		if(vo1.getContent().length() >= 30 && vo1.getImage().length() == 0) {
			pointTmpVO = paymentCompleteService.getMemberPoint(pointTmpVO);
			pointTmpVO.setPayment_point(pointTmpVO.getPayment_point() - 100);
			paymentCompleteService.updateMemberPoint(pointTmpVO);
			
			pointHistoryVO.setPoint_history_point(100);
			pointHistoryVO.setPoint_history_explain("후기 삭제 차감 포인트");
			pointHistoryVO.setPoint_history_type(0);
			pointHistoryService.insertPointHistory(pointHistoryVO);
		}else if(vo1.getContent().length() >= 30 && vo1.getImage().length() > 0) {
			pointTmpVO = paymentCompleteService.getMemberPoint(pointTmpVO);
			pointTmpVO.setPayment_point(pointTmpVO.getPayment_point() - 300);
			paymentCompleteService.updateMemberPoint(pointTmpVO);
			
			pointHistoryVO.setPoint_history_point(300);
			pointHistoryVO.setPoint_history_explain("후기 삭제 차감 포인트");
			pointHistoryVO.setPoint_history_type(0);
			pointHistoryService.insertPointHistory(pointHistoryVO);
		}
		
		myReviewWriteService.deleteReview(vo1);
		return null;
	}
}
