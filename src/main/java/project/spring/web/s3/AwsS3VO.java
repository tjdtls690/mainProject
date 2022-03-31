package project.spring.web.s3;

public class AwsS3VO {
	private String a_key;
	private String s_key;

	public String getA_key() {
		return a_key;
	}

	public void setA_key(String a_key) {
		this.a_key = a_key;
	}

	public String getS_key() {
		return s_key;
	}

	public void setS_key(String s_key) {
		this.s_key = s_key;
	}

	@Override
	public String toString() {
		return "AwsS3VO [a_key=" + a_key + ", s_key=" + s_key + "]";
	}

}
