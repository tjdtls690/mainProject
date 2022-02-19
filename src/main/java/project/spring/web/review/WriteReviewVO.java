package project.spring.web.review;

import java.time.LocalDateTime;

public class WriteReviewVO {
	private int seq;
	private int itemNum;
	private int star;
	private String userName;
	private String content;
	private LocalDateTime writeDate;
	private String image;
	private String reply;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteDate() {
		return String.valueOf(writeDate).substring(0, 10);
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", itemNum=" + itemNum + ", star=" + star + ", userName=" + userName
				+ ", content=" + content + ", writeDate=" + writeDate + ", image=" + image + ", reply=" + reply
				+ ", getSeq()=" + getSeq() + ", getItemNum()=" + getItemNum() + ", getStar()=" + getStar()
				+ ", getUserName()=" + getUserName() + ", getContent()=" + getContent() + ", getWriteDate()="
				+ getWriteDate() + ", getImage()=" + getImage() + ", getReply()=" + getReply() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
