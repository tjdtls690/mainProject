package project.spring.web.adminMemberManagement;

import java.time.LocalDate;

public class AdminMemberManagementVO {
	private int memberCode;
	private String memberName;
	private String memberNickname;
	private String memberEmail;
	private String memberGender;
	private LocalDate memberBirthday;
	private String memberPhone;
	private String memberStop;
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public LocalDate getMemberBirthday() {
		return memberBirthday;
	}
	public void setMemberBirthday(LocalDate memberBirthday) {
		this.memberBirthday = memberBirthday;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberStop() {
		return memberStop;
	}
	public void setMemberStop(String memberStop) {
		this.memberStop = memberStop;
	}
	@Override
	public String toString() {
		return "AdminMemberManagementVO [memberCode=" + memberCode + ", memberName=" + memberName + ", memberNickname="
				+ memberNickname + ", memberEmail=" + memberEmail + ", memberGender=" + memberGender
				+ ", memberBirthday=" + memberBirthday + ", memberPhone=" + memberPhone + ", memberStop=" + memberStop
				+ "]";
	}
	
}
