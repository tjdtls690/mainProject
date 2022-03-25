package project.spring.web.admin_review;

import java.time.LocalDate;

public class AdminReviewVO {
	public int seq;
	public int item_code;
	public int subscribe_code;
	public String user_name;
	public LocalDate write_date;
	public String content;
	public String reply;
	public String item_name;
	public String subscribe_name;
	public int item_tag_main;
	public int subscribe_tag_main;
	
	public int getSubscribe_tag_main() {
		return subscribe_tag_main;
	}
	public void setSubscribe_tag_main(int subscribe_tag_main) {
		this.subscribe_tag_main = subscribe_tag_main;
	}
	public int getItem_tag_main() {
		return item_tag_main;
	}
	public void setItem_tag_main(int item_tag_main) {
		this.item_tag_main = item_tag_main;
	}
	public String getSubscribe_name() {
		return subscribe_name;
	}
	public void setSubscribe_name(String subscribe_name) {
		this.subscribe_name = subscribe_name;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
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
	public int getSubscribe_code() {
		return subscribe_code;
	}
	public void setSubscribe_code(int subscribe_code) {
		this.subscribe_code = subscribe_code;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public LocalDate getWrite_date() {
		return write_date;
	}
	public void setWrite_date(LocalDate write_date) {
		this.write_date = write_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
}
