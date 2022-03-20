package project.spring.web.paymentComplete.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Repository
public class PaymentCompleteDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo) {
		return sqlSessionTemplate.insert("PaymentDAO.paymentInfoSave", vo);
	}
}
