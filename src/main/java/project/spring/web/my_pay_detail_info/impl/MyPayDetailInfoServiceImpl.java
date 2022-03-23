package project.spring.web.my_pay_detail_info.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.my_pay_detail_info.MyPayDetailInfoService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Service
public class MyPayDetailInfoServiceImpl implements MyPayDetailInfoService{
	
	@Autowired
	MyPayDetailInfoDAO myPayDetailInfoDAO;

	@Override
	public PaymentMyDetailSideInfoVO getMemberPaymentDeailInfo(PaymentMyDetailSideInfoVO vo) {
		return myPayDetailInfoDAO.getMemberPaymentDeailInfo(vo);
	}

	@Override
	public List<PaymentMyDetailInfoVO> getMemberPayMappingItemInfo(PaymentMyDetailInfoVO vo) {
		return myPayDetailInfoDAO.getMemberPayMappingItemInfo(vo);
	}
	
}
