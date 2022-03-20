package project.spring.web.admin_order_management.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
