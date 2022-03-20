package project.spring.web.admin_order_management;

import java.util.List;

import project.spring.web.adminLogin.AdminLoginVO;

public interface AdminOrderService {
	public List<AdminOrderVO> getOrderList(AdminOrderVO vo);
}
