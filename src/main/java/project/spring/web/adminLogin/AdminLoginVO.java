package project.spring.web.adminLogin;

public class AdminLoginVO {
	private String admin_id;
	private String admin_pwd;
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}
	@Override
	public String toString() {
		return "AdminLoginVO [admin_id=" + admin_id + ", admin_pwd=" + admin_pwd + "]";
	}
	
}
