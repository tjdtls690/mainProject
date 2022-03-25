package project.spring.web.point_history;

import java.time.LocalDate;

public class PointHistoryVO {
	private int point_history_code;
	private int point_history_member_code;
	private int point_history_point;
	private LocalDate point_history_date;
	private String point_history_explain;

	public int getPoint_history_code() {
		return point_history_code;
	}

	public void setPoint_history_code(int point_history_code) {
		this.point_history_code = point_history_code;
	}

	public int getPoint_history_member_code() {
		return point_history_member_code;
	}

	public void setPoint_history_member_code(int point_history_member_code) {
		this.point_history_member_code = point_history_member_code;
	}

	public int getPoint_history_point() {
		return point_history_point;
	}

	public void setPoint_history_point(int point_history_point) {
		this.point_history_point = point_history_point;
	}

	public LocalDate getPoint_history_date() {
		return point_history_date;
	}

	public void setPoint_history_date(LocalDate point_history_date) {
		this.point_history_date = point_history_date;
	}

	public String getPoint_history_explain() {
		return point_history_explain;
	}

	public void setPoint_history_explain(String point_history_explain) {
		this.point_history_explain = point_history_explain;
	}

	@Override
	public String toString() {
		return "PointHistoryVO [point_history_code=" + point_history_code + ", point_history_member_code="
				+ point_history_member_code + ", point_history_point=" + point_history_point + ", point_history_date="
				+ point_history_date + ", point_history_explain=" + point_history_explain + "]";
	}

}
