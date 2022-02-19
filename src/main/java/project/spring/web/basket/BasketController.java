package project.spring.web.basket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BasketController {
	
	
	@RequestMapping("/basket.do")
	public ModelAndView basketDo(ModelAndView mav) {
		
		mav.setViewName("basket");
		return mav;
	}
}
