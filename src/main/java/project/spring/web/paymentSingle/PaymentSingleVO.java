package project.spring.web.paymentSingle;

public class PaymentSingleVO {
	private String paymentItem;
	private String paymentDisposable;
	private String paymentItemQuantity;
	private String paymentPrice;
	private String paymentSalePrice;
	private String paymentTagMain;
	private String paymentItemCode;

	public String getPaymentTagMain() {
		return paymentTagMain;
	}

	public void setPaymentTagMain(String paymentTagMain) {
		this.paymentTagMain = paymentTagMain;
	}

	public String getPaymentItemCode() {
		return paymentItemCode;
	}

	public void setPaymentItemCode(String paymentItemCode) {
		this.paymentItemCode = paymentItemCode;
	}

	public String getPaymentItem() {
		return paymentItem;
	}

	public void setPaymentItem(String paymentItem) {
		this.paymentItem = paymentItem;
	}

	public String getPaymentDisposable() {
		return paymentDisposable;
	}

	public void setPaymentDisposable(String paymentDisposable) {
		this.paymentDisposable = paymentDisposable;
	}

	public String getPaymentItemQuantity() {
		return paymentItemQuantity;
	}

	public void setPaymentItemQuantity(String paymentItemQuantity) {
		this.paymentItemQuantity = paymentItemQuantity;
	}

	public String getPaymentPrice() {
		return paymentPrice;
	}

	public void setPaymentPrice(String paymentPrice) {
		this.paymentPrice = paymentPrice;
	}

	public String getPaymentSalePrice() {
		return paymentSalePrice;
	}

	public void setPaymentSalePrice(String paymentSalePrice) {
		this.paymentSalePrice = paymentSalePrice;
	}

	@Override
	public String toString() {
		return "PaymentSingleVO [paymentItem=" + paymentItem + ", paymentDisposable=" + paymentDisposable
				+ ", paymentItemQuantity=" + paymentItemQuantity + ", paymentPrice=" + paymentPrice
				+ ", paymentSalePrice=" + paymentSalePrice + ", paymentTagMain=" + paymentTagMain + ", paymentItemCode="
				+ paymentItemCode + "]";
	}

}
