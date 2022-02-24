package project.spring.web.order;

import java.time.LocalDate;

public class OrderVO {
	private int seq;
	private int item_code;
	private int amount;
	private int price;
	private int price_sub;
	private int tag_main;
	private int tag_sub;
	private int user_code;
	private String address;
	private LocalDate  delivery_date;
	private String item_name;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice_sub() {
		return price_sub;
	}
	public void setPrice_sub(int price_sub) {
		this.price_sub = price_sub;
	}
	public int getTag_main() {
		return tag_main;
	}
	public void setTag_main(int tag_main) {
		this.tag_main = tag_main;
	}
	public int getTag_sub() {
		return tag_sub;
	}
	public void setTag_sub(int tag_sub) {
		this.tag_sub = tag_sub;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public LocalDate getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(LocalDate delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	@Override
	public String toString() {
		return "OrderVO [seq=" + seq + ", item_code=" + item_code + ", amount=" + amount + ", price=" + price
				+ ", price_sub=" + price_sub + ", tag_main=" + tag_main + ", tag_sub=" + tag_sub + ", user_code="
				+ user_code + ", address=" + address + ", delivery_date=" + delivery_date + ", item_name=" + item_name
				+ "]";
	}
	
}
