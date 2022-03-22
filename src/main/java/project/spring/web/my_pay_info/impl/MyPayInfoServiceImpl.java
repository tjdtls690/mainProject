package project.spring.web.my_pay_info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.my_pay_info.MyPayInfoService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Service
public class MyPayInfoServiceImpl implements MyPayInfoService{
	
	@Autowired
	MyPayInfoDAO myPayInfoDAO;

	@Override
	public List<PaymentMyDetailSideInfoVO> getMemberAllPaymentInfo(PaymentMyDetailSideInfoVO vo) {
		return myPayInfoDAO.getMemberAllPaymentInfo(vo);
	}

	@Override
	public List<PaymentMyDetailInfoVO> getMemberPayMappingItemInfo(PaymentMyDetailInfoVO vo) {
		return myPayInfoDAO.getMemberPayMappingItemInfo(vo);
	}
	
}
