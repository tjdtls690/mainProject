package project.spring.web.my_pay_info;

import java.util.List;

import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

public interface MyPayInfoService {
	public List<PaymentMyDetailSideInfoVO> getMemberAllPaymentInfo(PaymentMyDetailSideInfoVO vo);
	public List<PaymentMyDetailInfoVO> getMemberPayMappingItemInfo(PaymentMyDetailInfoVO vo);
}
