package project.spring.web.admin_order_management;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderManagementController {
	
	@Autowired
	AdminOrderService adminOrderService;
	
	@RequestMapping("/orderManagement.mdo")
	public ModelAndView orderManagementDo(ModelAndView mav, AdminOrderVO vo) {
		
		List<AdminOrderVO> orderList = adminOrderService.getOrderList(vo);
		mav.addObject("orderList",orderList);
		mav.setViewName("orderManagement");
		return mav;
	}
}
