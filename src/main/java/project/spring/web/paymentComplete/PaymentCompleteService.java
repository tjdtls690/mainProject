package project.spring.web.paymentComplete;

public interface PaymentCompleteService {
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo);
	public int paymentMappingItemInfoSave(PaymentMyDetailInfoVO vo);
	public int deleteItem(PaymentMyDetailInfoVO vo);
}
