package project.spring.web.admin_main_chart;

public class AdminMainChartVO {
	private String date;
	private String daySum;
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDaySum() {
		return daySum;
	}
	public void setDaySum(String daySum) {
		this.daySum = daySum;
	}
	
	@Override
	public String toString() {
		return "AdminMainChartVO [date=" + date + ", daySum=" + daySum + "]";
	}
	
	

}
