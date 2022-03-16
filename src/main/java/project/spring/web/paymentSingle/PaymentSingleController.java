package project.spring.web.paymentSingle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.member_zipcode.MemberZipcodeService;
import project.spring.web.member_zipcode.MemberZipcodeVO;

@Controller
public class PaymentSingleController {
	
	@Autowired
	MemberZipcodeService memberZipcodeService;
	@Autowired
	PaymentSingleService paymentSingleService;
	
	@RequestMapping("/paymentSingle.do")
	public ModelAndView paymentSingleDo(ModelAndView mav, @ModelAttribute(value="PaymentSingleListVO") PaymentSingleListVO list
			, PaymentSingleSideInfoVO vo) {
		mav.addObject("vo", vo);
		mav.addObject("list", list.getPaymentSingleList());
		mav.setViewName("paymentSingle");
		return mav;
	}
	
	@RequestMapping("/paymentArrow.do")
	public ModelAndView paymentArrowDo(ModelAndView mav, String check) {
		
		mav.addObject("check", check);
		mav.setViewName("paymentArrow");
		return mav;
	}
	
	@RequestMapping(value = "/getZipcode.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getZipcodeDo(String deliveryZipcodeCode) {
		MemberZipcodeVO vo = new MemberZipcodeVO();
		vo.setMember_zipcode_code(Integer.parseInt(deliveryZipcodeCode));
		System.out.println(deliveryZipcodeCode);
		
		return memberZipcodeService.getZipcodeAll2(vo).getMember_zipcode();
	}
	
	@RequestMapping("/paymentEnterExitType.do")
	public ModelAndView paymentEnterExitTypeDo(ModelAndView mav, String check) {
		mav.setViewName("paymentEnterExitType");
		return mav;
	}
	
	@RequestMapping("/paymentCouponModal.do")
	public ModelAndView paymentCouponModalDo(ModelAndView mav, PaymentSingleCouponInfoVO vo) {
		List<PaymentSingleCouponInfoVO> list = paymentSingleService.getMyPaymentCoupon(vo);
		
		mav.addObject("list", list);
		mav.setViewName("paymentCouponModal");
		return mav;
	}
}
