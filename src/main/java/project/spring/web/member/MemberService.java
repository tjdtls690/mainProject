package project.spring.web.member;

public interface MemberService {
	public int checkEmail(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public int insertMember(MemberVO vo);
	public int checkPhone(MemberVO vo);
	public MemberVO getMemberPhone(MemberVO vo);
	public int passwordCheck(MemberVO vo);
	public int findEmail(MemberVO vo);
	public MemberVO phoneNameGetMember(MemberVO vo);
	public int findPassword(MemberVO vo);
	public MemberVO EmailPhoneGetMember(MemberVO vo);
	public int updatePassword(MemberVO vo);
}
