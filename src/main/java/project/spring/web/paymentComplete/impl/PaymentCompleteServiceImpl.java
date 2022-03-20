package project.spring.web.paymentComplete.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Service
public class PaymentCompleteServiceImpl  implements PaymentCompleteService{
	
	@Autowired
	PaymentCompleteDAO paymentCompleteDAO;

	@Override
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo) {
		return paymentCompleteDAO.paymentInfoSave(vo);
	}
	
	
}
