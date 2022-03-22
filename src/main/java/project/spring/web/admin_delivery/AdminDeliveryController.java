package project.spring.web.admin_delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Controller
public class AdminDeliveryController {
	
	@Autowired
	PaymentCompleteService paymentCompleteService;
	
	@RequestMapping("/deliverycompletedManagement.mdo")
	public ModelAndView DeliveryDo(ModelAndView mav) {
		PaymentMyDetailSideInfoVO vo = new PaymentMyDetailSideInfoVO();
		List<PaymentMyDetailSideInfoVO> payment = paymentCompleteService.getAllPaymentDetail(vo);
		System.out.println(payment.get(0).getPayment_final_price());
		mav.addObject("paymentList", payment);
		mav.setViewName("deliverycompletedManagement");
		return mav;
	}
}
