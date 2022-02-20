package project.spring.web.basket;

public class BasketVO {
	private String itemImage;
	private String itemName;
	private int tagMain;
	private int tagSub;
	private int amount;
	private int price;
	private int priceSub;
	private String userName;
	
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getTagMain() {
		return tagMain;
	}
	public void setTagMain(int tagMain) {
		this.tagMain = tagMain;
	}
	public int getTagSub() {
		return tagSub;
	}
	public void setTagSub(int tagSub) {
		this.tagSub = tagSub;
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
	public int getPriceSub() {
		return priceSub;
	}
	public void setPriceSub(int priceSub) {
		this.priceSub = priceSub;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Override
	public String toString() {
		return "BasketVO [itemImage=" + itemImage + ", itemName=" + itemName + ", tagMain=" + tagMain + ", tagSub="
				+ tagSub + ", amount=" + amount + ", price=" + price + ", priceSub=" + priceSub + ", userName="
				+ userName + "]";
	}
	
	
}
