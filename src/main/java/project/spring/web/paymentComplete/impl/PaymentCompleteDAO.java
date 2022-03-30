package project.spring.web.paymentComplete.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.event.CouponVO;
import project.spring.web.paymentComplete.PaymentCompletePointVO;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.paymentComplete.PaymentMyDetailSideInfoVO;

@Repository
public class PaymentCompleteDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int paymentInfoSave(PaymentMyDetailSideInfoVO vo) {
		return sqlSessionTemplate.insert("PaymentDAO.paymentInfoSave", vo);
	}
	
	public int paymentMappingItemInfoSave(PaymentMyDetailInfoVO vo) {
		return sqlSessionTemplate.insert("PaymentDAO.paymentMappingItemInfoSave", vo);
	}
	
	public int deleteItem(PaymentMyDetailInfoVO vo) {
		return sqlSessionTemplate.delete("PaymentDAO.deleteItem", vo);
	}
	
	public List<PaymentMyDetailSideInfoVO> getAllPaymentDetail(PaymentMyDetailSideInfoVO vo) {
		return sqlSessionTemplate.selectList("PaymentDAO.getAllPaymentDetail");
	}
    
	public int useCouponProhibition(CouponVO vo) {
		return sqlSessionTemplate.update("PaymentDAO.useCouponProhibition", vo);
	}
	
	public PaymentCompletePointVO getMemberPoint(PaymentCompletePointVO vo) {
		return sqlSessionTemplate.selectOne("PaymentDAO.getMemberPoint", vo);
	}
	
	public int updateMemberPoint(PaymentCompletePointVO vo) {
		return sqlSessionTemplate.update("PaymentDAO.updateMemberPoint", vo);
	}
	
	public int insertMemberPoint(PaymentCompletePointVO vo) {
		return sqlSessionTemplate.insert("PaymentDAO.insertMemberPoint", vo);
	}
	
	public List<PaymentMyDetailInfoVO> getMemberPayMappingMemberCodeInfo(PaymentMyDetailInfoVO vo) {
		return sqlSessionTemplate.selectList("PaymentDAO.getMemberPayMappingMemberCodeInfo", vo);
	}
	
	public int deleteMemberPoint(PaymentMyDetailInfoVO vo) {
		return sqlSessionTemplate.delete("PaymentDAO.deleteMemberPoint", vo);
	}
}
