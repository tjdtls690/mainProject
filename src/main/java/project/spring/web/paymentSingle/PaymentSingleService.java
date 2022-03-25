package project.spring.web.paymentSingle;

import java.util.List;

import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;

public interface PaymentSingleService {
	List<PaymentSingleCouponInfoVO> getMyPaymentCoupon(PaymentSingleCouponInfoVO vo);
	public int updatePaymentMappingCode(PaymentMyDetailInfoVO vo);
}
