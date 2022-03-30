package project.spring.web.paymentComplete;

import java.util.List;
import project.spring.web.event.CouponVO;

public interface PaymentCompleteService {
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo);
	public int paymentMappingItemInfoSave(PaymentMyDetailInfoVO vo);
	public int deleteItem(PaymentMyDetailInfoVO vo);
	public List<PaymentMyDetailSideInfoVO> getAllPaymentDetail(PaymentMyDetailSideInfoVO vo);
	public int useCouponProhibition(CouponVO vo);
	public PaymentCompletePointVO getMemberPoint(PaymentCompletePointVO vo);
	public int updateMemberPoint(PaymentCompletePointVO vo);
	public int insertMemberPoint(PaymentCompletePointVO vo);
	public List<PaymentMyDetailInfoVO> getMemberPayMappingMemberCodeInfo(PaymentMyDetailInfoVO vo);
	public int deleteMemberPoint(PaymentMyDetailInfoVO vo);
}
