package project.spring.web.admin_banner_management;

public class AdminBannerManagementVO {
	private int seq;
	private String name; // 이름
	private String content; // 설명
	private String image; //url
	private String id; // slide 번호
	private String mobile;
	private String banner_filepath; // 배너


	
	@Override
	public String toString() {
		return "AdminBannerManagementVO [seq=" + seq + ", name=" + name + ", content=" + content + ", image=" + image
				+ ", id=" + id + ", mobile=" + mobile + ", banner_filepath=" + banner_filepath + "]";
	}
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getBanner_filepath() {
		return banner_filepath;
	}
	public void setBanner_filepath(String banner_filepath) {
		this.banner_filepath = banner_filepath;
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
	
}
