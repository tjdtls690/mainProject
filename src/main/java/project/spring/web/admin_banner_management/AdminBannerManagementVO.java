package project.spring.web.admin_banner_management;

public class AdminBannerManagementVO {
	private int seq;
	private String name;
	private String content;
	private String image;
	private String id;
	private String mobile;
	
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "AdminBannerManagementVO [seq=" + seq + ", name=" + name + ", content=" + content + ", image=" + image
				+ ", id=" + id + ", mobile=" + mobile + "]";
	}
	

	
	
}
