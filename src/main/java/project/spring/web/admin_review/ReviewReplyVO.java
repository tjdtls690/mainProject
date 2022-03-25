package project.spring.web.admin_review;

import java.time.LocalDate;

public class ReviewReplyVO {
	public int seq;
	public LocalDate replydate;
	public String replycontents;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public LocalDate getReplydate() {
		return replydate;
	}
	public void setReplydate(LocalDate replydate) {
		this.replydate = replydate;
	}
	public String getReplycontents() {
		return replycontents;
	}
	public void setReplycontents(String replycontents) {
		this.replycontents = replycontents;
	}
	
}
