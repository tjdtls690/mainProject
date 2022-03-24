package project.spring.web.my_delivery;

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
import project.spring.web.member.MemberVO;
import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Controller
public class MyDeliveryController {
	
	@Autowired
	MyPayInfoService myPayInfoService;
	@Autowired
	DetailService detailService;
	
	
	@RequestMapping("myDelivery.do")
	public ModelAndView myDeliveryDo(ModelAndView mav, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO vo1 = (MemberVO)session.getAttribute("member");
		
		PaymentMyDetailSideInfoVO vo2 = new PaymentMyDetailSideInfoVO();
		vo2.setPayment_member_code(vo1.getMemberCode());
		List<PaymentMyDetailSideInfoVO> list1 = myPayInfoService.getMemberAllPaymentInfo(vo2);
		List<List<PaymentMyDetailInfoVO>> list2 = new ArrayList<List<PaymentMyDetailInfoVO>>();
		List<DetailVO> list4 = new ArrayList<DetailVO>();
		for(int i = 0; i < list1.size(); i++) {
			PaymentMyDetailInfoVO vo3 = new PaymentMyDetailInfoVO();
			vo3.setPayment_code(list1.get(i).getPayment_code());
			List<PaymentMyDetailInfoVO> list3 = myPayInfoService.getMemberPayMappingItemInfo(vo3);
			list2.add(list3);
		}
		
		for(int i = 0; i < list2.size(); i++) {
			int itemCode = list2.get(i).get(0).getPayment_item_mapping_item_code();
			int itemTagMain = list2.get(i).get(0).getPayment_item_mapping_tag_main();
			DetailVO vo4 = new DetailVO();
			vo4.setItem_code(itemCode);
			vo4.setItem_tag_main(itemTagMain);
			if(itemTagMain == 100 || itemTagMain == 600) {
				list4.add(detailService.getSubItem(vo4));
			}else {
				list4.add(detailService.getItem(vo4));
			}
		}
		
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list4);
		
		mav.setViewName("myDelivery");
		return mav;
	}
}
