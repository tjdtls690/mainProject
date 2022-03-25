package project.spring.web.admin_order_management;

import java.util.List;

import project.spring.web.adminLogin.AdminLoginVO;
import project.spring.web.detail.DetailVO;

public interface AdminOrderService {
	public List<AdminOrderVO> getOrderList(AdminOrderVO vo);
	
	public List<AdminOrderInfoVO> getInfoList(AdminOrderInfoVO vo);
	
	void orderDeliveryChange(AdminOrderVO vo);

	public List<AdminOrderVO> getOrderDeliveryList(AdminOrderVO vo);
	
	void orderDeliveryComplete(AdminOrderVO vo);

	public List<AdminOrderVO> getOrderDeliveryCompleteList(AdminOrderVO vo);
}
