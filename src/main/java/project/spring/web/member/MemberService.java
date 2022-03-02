package project.spring.web.member;

public interface MemberService {
	public int checkEmail(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public int insertMember(MemberVO vo);
	public int checkPhone(MemberVO vo);
	public MemberVO getMemberPhone(MemberVO vo);
	public int passwordCheck(MemberVO vo);
}
