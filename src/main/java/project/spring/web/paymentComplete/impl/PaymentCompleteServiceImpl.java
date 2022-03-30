package project.spring.web.paymentComplete.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.event.CouponVO;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentCompleteService;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Service
public class PaymentCompleteServiceImpl  implements PaymentCompleteService{
	
	@Autowired
	PaymentCompleteDAO paymentCompleteDAO;

	@Override
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo) {
		return paymentCompleteDAO.paymentInfoSave(vo);
	}

	@Override
	public int paymentMappingItemInfoSave(PaymentMyDetailInfoVO vo) {
		return paymentCompleteDAO.paymentMappingItemInfoSave(vo);
	}

	@Override
	public int deleteItem(PaymentMyDetailInfoVO vo) {
		return paymentCompleteDAO.deleteItem(vo);
	}

	@Override
	public List<PaymentMyDetailSideInfoVO> getAllPaymentDetail(PaymentMyDetailSideInfoVO vo) {
		return paymentCompleteDAO.getAllPaymentDetail(vo);
	}
  
	public int useCouponProhibition(CouponVO vo) {
		return paymentCompleteDAO.useCouponProhibition(vo);
	}

	@Override
	public PaymentCompletePointVO getMemberPoint(PaymentCompletePointVO vo) {
		return paymentCompleteDAO.getMemberPoint(vo);
	}

	@Override
	public int updateMemberPoint(PaymentCompletePointVO vo) {
		return paymentCompleteDAO.updateMemberPoint(vo);
	}

	@Override
	public int insertMemberPoint(PaymentCompletePointVO vo) {
		return paymentCompleteDAO.insertMemberPoint(vo);
	}

	@Override
	public List<PaymentMyDetailInfoVO> getMemberPayMappingMemberCodeInfo(PaymentMyDetailInfoVO vo) {
		return paymentCompleteDAO.getMemberPayMappingMemberCodeInfo(vo);
	}

	@Override
	public int deleteMemberPoint(PaymentMyDetailInfoVO vo) {
		return paymentCompleteDAO.deleteMemberPoint(vo);
	}
	
	
}
