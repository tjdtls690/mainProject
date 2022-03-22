package project.spring.web.paymentComplete;

public class PaymentCompletePointVO {
	private int payment_point_code;
	private int payment_member_code;
	private int payment_point;

	public int getPayment_point_code() {
		return payment_point_code;
	}

	public void setPayment_point_code(int payment_point_code) {
		this.payment_point_code = payment_point_code;
	}

	public int getPayment_member_code() {
		return payment_member_code;
	}

	public void setPayment_member_code(int payment_member_code) {
		this.payment_member_code = payment_member_code;
	}

	public int getPayment_point() {
		return payment_point;
	}

	public void setPayment_point(int payment_point) {
		this.payment_point = payment_point;
	}

	@Override
	public String toString() {
		return "PaymentCompletePointVO [payment_point_code=" + payment_point_code + ", payment_member_code="
				+ payment_member_code + ", payment_point=" + payment_point + "]";
	}

}
