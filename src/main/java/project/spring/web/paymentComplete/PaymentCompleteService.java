package project.spring.web.paymentComplete;

import java.util.List;

public interface PaymentCompleteService {
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo);
	public int paymentMappingItemInfoSave(PaymentMyDetailInfoVO vo);
	public int deleteItem(PaymentMyDetailInfoVO vo);
	public List<PaymentMyDetailSideInfoVO> getAllPaymentDetail(PaymentMyDetailSideInfoVO vo);
}
