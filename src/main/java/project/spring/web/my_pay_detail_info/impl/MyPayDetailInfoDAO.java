package project.spring.web.my_pay_detail_info.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Repository
public class MyPayDetailInfoDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public PaymentMyDetailSideInfoVO getMemberPaymentDeailInfo(PaymentMyDetailSideInfoVO vo) {
		return sqlSessionTemplate.selectOne("PaymentDAO.getMemberPaymentDeailInfo", vo);
	}
	
	public List<PaymentMyDetailInfoVO> getMemberPayMappingItemInfo(PaymentMyDetailInfoVO vo) {
		return sqlSessionTemplate.selectList("PaymentDAO.getMemberPayMappingItemInfo", vo);
	}
}
