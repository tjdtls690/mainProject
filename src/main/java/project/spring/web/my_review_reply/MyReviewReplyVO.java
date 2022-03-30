package project.spring.web.my_review_reply;

import java.time.LocalDate;

public class MyReviewReplyVO {
	private int seq;
	private LocalDate replydate;
	private String replycontents;

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

	@Override
	public String toString() {
		return "MyReviewReplyVO [seq=" + seq + ", replydate=" + replydate + ", replycontents=" + replycontents + "]";
	}

}
