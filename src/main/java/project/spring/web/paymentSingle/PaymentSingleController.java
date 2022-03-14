package project.spring.web.paymentSingle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentSingleController {
	
	
	@RequestMapping("/paymentSingle.do")
	public ModelAndView paymentSingleDo(ModelAndView mav) {
		mav.setViewName("paymentSingle");
		return mav;
	}
}
