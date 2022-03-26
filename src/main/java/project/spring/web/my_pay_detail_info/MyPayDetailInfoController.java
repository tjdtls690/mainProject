package project.spring.web.my_pay_detail_info;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Controller
public class MyPayDetailInfoController {
	
	@Autowired
	MyPayDetailInfoService myPayDetailInfoService;
	@Autowired
	DetailService detailService;
	
	
	@RequestMapping("/myPayDetailInfo.do")
	public ModelAndView myPayDetailDo(ModelAndView mav, PaymentMyDetailSideInfoVO vo) {
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
		
		mav.addObject("vo", vo);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.setViewName("myPayDetailInfo");
		return mav;
	}
}
