package project.spring.web.admin_order_management;

public class AdminOrderInfoVO {

	private int payment_item_mapping_code;
	private int payment_code;
	private int payment_member_code;
	private int payment_item_mapping_tag_main;
	private int payment_item_mapping_item_code;
	private String payment_item_mapping_item_name_size;
	private int payment_item_mapping_item_quantity;
	private int payment_item_mapping_item_price;
	
	public int getPayment_item_mapping_code() {
		return payment_item_mapping_code;
	}
	public void setPayment_item_mapping_code(int payment_item_mapping_code) {
		this.payment_item_mapping_code = payment_item_mapping_code;
	}
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
	public int getPayment_item_mapping_tag_main() {
		return payment_item_mapping_tag_main;
	}
	public void setPayment_item_mapping_tag_main(int payment_item_mapping_tag_main) {
		this.payment_item_mapping_tag_main = payment_item_mapping_tag_main;
	}
	public int getPayment_item_mapping_item_code() {
		return payment_item_mapping_item_code;
	}
	public void setPayment_item_mapping_item_code(int payment_item_mapping_item_code) {
		this.payment_item_mapping_item_code = payment_item_mapping_item_code;
	}
	public String getPayment_item_mapping_item_name_size() {
		return payment_item_mapping_item_name_size;
	}
	public void setPayment_item_mapping_item_name_size(String payment_item_mapping_item_name_size) {
		this.payment_item_mapping_item_name_size = payment_item_mapping_item_name_size;
	}
	public int getPayment_item_mapping_item_quantity() {
		return payment_item_mapping_item_quantity;
	}
	public void setPayment_item_mapping_item_quantity(int payment_item_mapping_item_quantity) {
		this.payment_item_mapping_item_quantity = payment_item_mapping_item_quantity;
	}
	public int getPayment_item_mapping_item_price() {
		return payment_item_mapping_item_price;
	}
	public void setPayment_item_mapping_item_price(int payment_item_mapping_item_price) {
		this.payment_item_mapping_item_price = payment_item_mapping_item_price;
	}
	
	@Override
	public String toString() {
		return "AdminOrderInfoVO [payment_item_mapping_code=" + payment_item_mapping_code + ", payment_code="
				+ payment_code + ", payment_member_code=" + payment_member_code + ", payment_item_mapping_tag_main="
				+ payment_item_mapping_tag_main + ", payment_item_mapping_item_code=" + payment_item_mapping_item_code
				+ ", payment_item_mapping_item_name_size=" + payment_item_mapping_item_name_size
				+ ", payment_item_mapping_item_quantity=" + payment_item_mapping_item_quantity
				+ ", payment_item_mapping_item_price=" + payment_item_mapping_item_price + "]";
	}
	

	
	
}
