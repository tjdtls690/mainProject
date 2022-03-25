package project.spring.web.admin_order_management;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/orderManagementModal.mdo")
	public ModelAndView orderManagementModal(ModelAndView mav, AdminOrderInfoVO vo, HttpServletRequest request) {

		String code = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(code);
		System.out.println(itemCode);
		vo.setPayment_code(itemCode);
		
		List<AdminOrderInfoVO> infoList = adminOrderService.getInfoList(vo);
		mav.addObject("info", infoList);
		mav.setViewName("orderManagementModal");
		return mav;
	}
	
	@RequestMapping("/orderManagementModal2.mdo")
	public ModelAndView orderManagementModal2(ModelAndView mav, AdminOrderInfoVO vo, HttpServletRequest request) {

		String code = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(code);
		System.out.println(itemCode);
		vo.setPayment_code(itemCode);
		
		List<AdminOrderInfoVO> infoList = adminOrderService.getInfoList(vo);
		mav.addObject("info", infoList);
		mav.setViewName("orderManagementModal2");
		return mav;
	}

	@RequestMapping("/orderDelivery.mdo")
	public ModelAndView orderDeliveryChange(ModelAndView mav, AdminOrderVO vo, HttpServletRequest request) {
		
		String code = request.getParameter("itemCode");
		int itemCode = Integer.parseInt(code);
		vo.setPayment_code(itemCode);
		vo.setPayment_delivery_condition("배송중");
		adminOrderService.orderDeliveryChange(vo);
		
		AdminOrderVO vo2 = new AdminOrderVO();
		List<AdminOrderVO> orderList = adminOrderService.getOrderList(vo2);
		mav.addObject("orderList",orderList);
		mav.setViewName("orderManagement");
		return mav;
	}
	
	@RequestMapping("/orderManagementDelivery.mdo")
	public ModelAndView orderManagementDelivery(ModelAndView mav, AdminOrderVO vo) {
		
		List<AdminOrderVO> orderList = adminOrderService.getOrderDeliveryList(vo);
		mav.addObject("orderList",orderList);
		mav.setViewName("orderManagementDelivery");
		return mav;
	}
	
	@RequestMapping("/orderManagementDeliveryChange.mdo")
	public ModelAndView orderManagementDeliveryChange(ModelAndView mav, AdminOrderVO vo, String[] newDeleteItemId) {
		List<String> list1 = new ArrayList<>();
		
		for (int i = 0; i < newDeleteItemId.length; i++) {
			System.out.println(newDeleteItemId[i]);
			list1.add(newDeleteItemId[i]);
			String s = list1.get(i);
			int code = Integer.parseInt(s);
			vo.setPayment_code(code);
			vo.setPayment_delivery_condition("배송완료");
			adminOrderService.orderDeliveryComplete(vo);
		}
		
		AdminOrderVO vo2 = new AdminOrderVO();
		List<AdminOrderVO> orderList = adminOrderService.getOrderDeliveryList(vo2);
		mav.addObject("orderList",orderList);
		mav.setViewName("orderManagementDelivery");
		return mav;
	}
	
	@RequestMapping("/orderManagementDeliveryComplete.mdo")
	public ModelAndView deliverycompletedManagement(ModelAndView mav, AdminOrderVO vo) {
		
		List<AdminOrderVO> orderList = adminOrderService.getOrderDeliveryCompleteList(vo);
		mav.addObject("orderList",orderList);
		mav.setViewName("orderManagementDeliveryComplete");
		return mav;
	}
}
