package project.spring.web.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	
	@RequestMapping("/order.do")
	public ModelAndView orderDo(ModelAndView mav) {
		mav.setViewName("order");
		return mav;
	}
}
