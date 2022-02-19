package project.spring.web.tag;

public class TagVO {
	private String tagNameMain;
	private int tagMain;
	private String tagNameSub;
	private int tagSub;

	public String getTagNameMain() {
		return tagNameMain;
	}

	public void setTagNameMain(String tagNameMain) {
		this.tagNameMain = tagNameMain;
	}

	public int getTagMain() {
		return tagMain;
	}

	public void setTagMain(int tagMain) {
		this.tagMain = tagMain;
	}

	public String getTagNameSub() {
		return tagNameSub;
	}

	public void setTagNameSub(String tagNameSub) {
		this.tagNameSub = tagNameSub;
	}

	public int getTagSub() {
		return tagSub;
	}

	public void setTagSub(int tagSub) {
		this.tagSub = tagSub;
	}

	@Override
	public String toString() {
		return "TagVO [tagNameMain=" + tagNameMain + ", tagMain=" + tagMain + ", tagNameSub=" + tagNameSub + ", tagSub="
				+ tagSub + "]";
	}
}
