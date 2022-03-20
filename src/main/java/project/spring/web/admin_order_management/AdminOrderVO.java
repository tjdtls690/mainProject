package project.spring.web.admin_order_management;

import java.time.LocalDate;

public class AdminOrderVO {
	private int payment_code;
	private int payment_member_code;
	private LocalDate payment_date;
	private String payment_recipient;
	private String payment_recipient_phone;
	private String payment_delivery_type;
	private String payment_zipcode;
	private String payment_address;
	private String payment_memo;
	private String payment_price;
	private String payment_delivery_price;
	private String payment_sum_price;
	private String payment_coupon_price;
	private String payment_point_price;
	private String payment_sail_price;
	private String payment_final_price;
	public int getPayment_code() {
		return payment_code;
	}
	public void setPayment_code(int payment_code) {
		this.payment_code = payment_code;
	}
	public int getPayment_member_code() {
		return payment_member_code;
	}
	public void setPayment_member_code(int payment_member_code) {
		this.payment_member_code = payment_member_code;
	}
	public LocalDate getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(LocalDate payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_recipient() {
		return payment_recipient;
	}
	public void setPayment_recipient(String payment_recipient) {
		this.payment_recipient = payment_recipient;
	}
	public String getPayment_recipient_phone() {
		return payment_recipient_phone;
	}
	public void setPayment_recipient_phone(String payment_recipient_phone) {
		this.payment_recipient_phone = payment_recipient_phone;
	}
	public String getPayment_delivery_type() {
		return payment_delivery_type;
	}
	public void setPayment_delivery_type(String payment_delivery_type) {
		this.payment_delivery_type = payment_delivery_type;
	}
	public String getPayment_zipcode() {
		return payment_zipcode;
	}
	public void setPayment_zipcode(String payment_zipcode) {
		this.payment_zipcode = payment_zipcode;
	}
	public String getPayment_address() {
		return payment_address;
	}
	public void setPayment_address(String payment_address) {
		this.payment_address = payment_address;
	}
	public String getPayment_memo() {
		return payment_memo;
	}
	public void setPayment_memo(String payment_memo) {
		this.payment_memo = payment_memo;
	}
	public String getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}
	public String getPayment_delivery_price() {
		return payment_delivery_price;
	}
	public void setPayment_delivery_price(String payment_delivery_price) {
		this.payment_delivery_price = payment_delivery_price;
	}
	public String getPayment_sum_price() {
		return payment_sum_price;
	}
	public void setPayment_sum_price(String payment_sum_price) {
		this.payment_sum_price = payment_sum_price;
	}
	public String getPayment_coupon_price() {
		return payment_coupon_price;
	}
	public void setPayment_coupon_price(String payment_coupon_price) {
		this.payment_coupon_price = payment_coupon_price;
	}
	public String getPayment_point_price() {
		return payment_point_price;
	}
	public void setPayment_point_price(String payment_point_price) {
		this.payment_point_price = payment_point_price;
	}
	public String getPayment_sail_price() {
		return payment_sail_price;
	}
	public void setPayment_sail_price(String payment_sail_price) {
		this.payment_sail_price = payment_sail_price;
	}
	public String getPayment_final_price() {
		return payment_final_price;
	}
	public void setPayment_final_price(String payment_final_price) {
		this.payment_final_price = payment_final_price;
	}
	@Override
	public String toString() {
		return "AdminOrderVO [payment_code=" + payment_code + ", payment_member_code=" + payment_member_code
				+ ", payment_date=" + payment_date + ", payment_recipient=" + payment_recipient
				+ ", payment_recipient_phone=" + payment_recipient_phone + ", payment_delivery_type="
				+ payment_delivery_type + ", payment_zipcode=" + payment_zipcode + ", payment_address="
				+ payment_address + ", payment_memo=" + payment_memo + ", payment_price=" + payment_price
				+ ", payment_delivery_price=" + payment_delivery_price + ", payment_sum_price=" + payment_sum_price
				+ ", payment_coupon_price=" + payment_coupon_price + ", payment_point_price=" + payment_point_price
				+ ", payment_sail_price=" + payment_sail_price + ", payment_final_price=" + payment_final_price + "]";
	}
	
}
