package project.spring.web.paymentComplete;

import java.util.List;

public class PaymentMyDetailInfoList {
	private List<PaymentMyDetailInfoVO> paymentMyDetailInfo;

	public List<PaymentMyDetailInfoVO> getPaymentMyDetailInfo() {
		return paymentMyDetailInfo;
	}

	public void setPaymentMyDetailInfo(List<PaymentMyDetailInfoVO> paymentMyDetailInfo) {
		this.paymentMyDetailInfo = paymentMyDetailInfo;
	}

	@Override
	public String toString() {
		return "PaymentMyDetailInfoList [paymentMyDetailInfo=" + paymentMyDetailInfo + "]";
	}

}
