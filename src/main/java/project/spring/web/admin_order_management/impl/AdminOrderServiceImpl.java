package project.spring.web.admin_order_management.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.admin_order_management.AdminOrderInfoVO;
import project.spring.web.admin_order_management.AdminOrderService;
import project.spring.web.admin_order_management.AdminOrderVO;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Autowired
	AdminOrderDAO adminOrderDAO;
	
	@Override
	public List<AdminOrderVO> getOrderList(AdminOrderVO vo) {
		return adminOrderDAO.getOrderList(vo);
	}
	
	@Override
	public List<AdminOrderInfoVO> getInfoList(AdminOrderInfoVO vo) {
		return adminOrderDAO.getInfoList(vo);
	}
	
	@Override
	public void orderDeliveryChange(AdminOrderVO vo) {
		adminOrderDAO.orderDeliveryChange(vo);
	}
	
	@Override
	public List<AdminOrderVO> getOrderDeliveryList(AdminOrderVO vo) {
		return adminOrderDAO.orderDeliveryList(vo);
	}
	
	@Override
	public void orderDeliveryComplete(AdminOrderVO vo) {
		adminOrderDAO.orderDeliveryComplete(vo);
	}
	
	@Override
	public List<AdminOrderVO> getOrderDeliveryCompleteList(AdminOrderVO vo) {
		return adminOrderDAO.orderDeliveryCompleteList(vo);
	}
}
