package project.spring.web.admin_order_management.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_order_management.AdminOrderInfoVO;
import project.spring.web.admin_order_management.AdminOrderVO;
import project.spring.web.detail.DetailVO;


@Repository
public class AdminOrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminOrderVO> getOrderList(AdminOrderVO vo) {
		return sqlSessionTemplate.selectList("AdminOrderDAO.getOrderList", vo);
	}
	
	public List<AdminOrderInfoVO> getInfoList(AdminOrderInfoVO vo) {
//		System.out.println("-->myBatis getItem");
		return sqlSessionTemplate.selectList("AdminOrderDAO.getInfoList",vo);
	}
	
	public void orderDeliveryChange(AdminOrderVO vo) {
		sqlSessionTemplate.update("AdminOrderDAO.orderDeliveryChange", vo);
	}
	
	public List<AdminOrderVO> orderDeliveryList(AdminOrderVO vo) {
		return sqlSessionTemplate.selectList("AdminOrderDAO.getOrderDeliveryList", vo);
	}
	
	public void orderDeliveryComplete(AdminOrderVO vo) {
		sqlSessionTemplate.update("AdminOrderDAO.orderDeliveryComplete", vo);
	}
	
	public List<AdminOrderVO> orderDeliveryCompleteList(AdminOrderVO vo) {
		return sqlSessionTemplate.selectList("AdminOrderDAO.getOrderDeliveryCompleteList", vo);
	}

}
