package project.spring.web.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.spring.web.detail.DetailVO;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/order.do")
	public ModelAndView orderDo(ModelAndView mav) {
		mav.setViewName("order");
		return mav;
	}
	
	@RequestMapping("/orderModal.do")
	public ModelAndView orderModalDo(ModelAndView mav, DetailVO vo) {
		mav.addObject("itemInfo", orderService.getitemInfo(vo));
		mav.setViewName("orderModal");
		return mav;
	}
	
	@RequestMapping("/orderShippingAddressExplainModal.do")
	public ModelAndView orderShippingAddressExplainModalDo(ModelAndView mav) {
		mav.setViewName("orderShippingAddressExplainModal");
		return mav;
	}
	
	@RequestMapping("/orderModalAjax.do")
	public ModelAndView orderModalAjaxDo(ModelAndView mav, DetailVO vo) {
		mav.addObject("itemInfo", orderService.getitemInfo(vo));
		mav.setViewName("orderModalAjax");
		return mav;
	}
	
	@RequestMapping("/orderDropDown.do")
	public ModelAndView orderDropDownDo(ModelAndView mav, DetailVO vo) {
		DetailVO vo1 = orderService.getitemInfoOne(vo);
		mav.addObject("item", vo1);
		mav.setViewName("orderDropDown");
		return mav;
	}
	
	@RequestMapping("/orderSaveTmp.do")
	public ModelAndView orderSaveTmpDo(ModelAndView mav, DetailVO vo, String itemSize, String itemPrice, String itemSizeSummary) {
		
		mav.addObject("itemSizeSummary", itemSizeSummary);
		mav.addObject("itemPrice", itemPrice);
		mav.addObject("itemSize", itemSize);
		mav.addObject("itemInfo", vo);
		mav.setViewName("orderSaveTmp");
		return mav;
	}
	
//	@RequestMapping("/orderHiddenSavePresentation.do")
//	public ModelAndView orderHiddenSavePresentationDo(ModelAndView mav) {
//		
//		mav.setViewName("orderHiddenSavePresentation");
//		return mav;
//	}
	
	@RequestMapping(value = "/calculate.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String calculateDo(DetailVO vo, String oldPrice, String price) {
		
		int price1 = Integer.parseInt(price.replace(",", ""));
		int oldPrice1 = Integer.parseInt(oldPrice);
		vo.setItem_price_m(price1 + oldPrice1);
		return vo.getItem_price_m();
	}
}
