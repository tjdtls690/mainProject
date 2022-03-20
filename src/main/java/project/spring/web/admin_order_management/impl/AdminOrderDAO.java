package project.spring.web.admin_order_management.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_order_management.AdminOrderVO;


@Repository
public class AdminOrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminOrderVO> getOrderList(AdminOrderVO vo) {
		return sqlSessionTemplate.selectList("AdminOrderDAO.getOrderList");
	}
}
