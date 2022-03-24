package project.spring.web.my_pay_detail_info;

import java.util.List;

import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

public interface MyPayDetailInfoService {
	public PaymentMyDetailSideInfoVO getMemberPaymentDeailInfo(PaymentMyDetailSideInfoVO vo);
	public List<PaymentMyDetailInfoVO> getMemberPayMappingItemInfo(PaymentMyDetailInfoVO vo);
}
