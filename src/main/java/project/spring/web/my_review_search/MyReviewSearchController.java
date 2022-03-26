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
import project.spring.web.member.MemberVO;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.my_review_write.MyReviewWriteVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;
import project.spring.web.paymentSingle.PaymentSingleService;

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
			if(list1.get(i).getPayment_item_mapping_review() == 1) {
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
	public String mySearchReviewDeleteDo(ModelAndView mav, PaymentMyDetailInfoVO vo) {
		vo.setPayment_item_mapping_review(2);
		paymentSingleService.updatePaymentMappingCode(vo);
		
		mav.setViewName("mySearchReviewDelete");
		return null;
	}
}
