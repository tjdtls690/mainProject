package project.spring.web.my_pay_info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Repository
public class MyPayInfoDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<PaymentMyDetailSideInfoVO> getMemberAllPaymentInfo(PaymentMyDetailSideInfoVO vo){
		return sqlSessionTemplate.selectList("PaymentDAO.getMemberAllPaymentInfo", vo);
	}
	
	public List<PaymentMyDetailInfoVO> getMemberPayMappingItemInfo(PaymentMyDetailInfoVO vo){
		return sqlSessionTemplate.selectList("PaymentDAO.getMemberPayMappingItemInfo", vo);
	}
}
