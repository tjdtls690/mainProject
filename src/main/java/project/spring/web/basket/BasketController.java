package project.spring.web.basket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	@RequestMapping("basket.do")
	public ModelAndView basketDo(ModelAndView mav) {
		BasketVO vo = new BasketVO();
		List<BasketVO> BasketList = basketService.getBasketList(vo);
		mav.addObject("Basket", BasketList);
		mav.setViewName("basket");
		return mav;
	}	
}
