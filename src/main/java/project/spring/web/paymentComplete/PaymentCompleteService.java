package project.spring.web.paymentComplete;

<<<<<<< HEAD
import java.util.List;
=======
import project.spring.web.event.CouponVO;
>>>>>>> c2182defc1a9ef624a889793ac4f47daa096cf84

public interface PaymentCompleteService {
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo);
	public int paymentMappingItemInfoSave(PaymentMyDetailInfoVO vo);
	public int deleteItem(PaymentMyDetailInfoVO vo);
<<<<<<< HEAD
	public List<PaymentMyDetailSideInfoVO> getAllPaymentDetail(PaymentMyDetailSideInfoVO vo);
=======
	public int useCouponProhibition(CouponVO vo);
	public PaymentCompletePointVO getMemberPoint(PaymentCompletePointVO vo);
	public int updateMemberPoint(PaymentCompletePointVO vo);
	public int insertMemberPoint(PaymentCompletePointVO vo);
>>>>>>> c2182defc1a9ef624a889793ac4f47daa096cf84
}
