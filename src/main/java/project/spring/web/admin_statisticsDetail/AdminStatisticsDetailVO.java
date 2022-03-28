package project.spring.web.admin_statisticsDetail;

public class AdminStatisticsDetailVO {
	int code;
	String date;
	int tagMain;
	int itemCode;
	String name;
	int quantity;
	int price;
	// 시작일 마지막일 주는용도로만쓰임
	String start;
	String end;
	// 파이차트 메인 용
	int count;
	// 파이차트 저체 요약 보기 중 가격 찍을것
	int sum;
	
	
	
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTagMain() {
		return tagMain;
	}
	public void setTagMain(int tagMain) {
		this.tagMain = tagMain;
	}
	public int getItemCode() {
		return itemCode;
	}
	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	
	
}
