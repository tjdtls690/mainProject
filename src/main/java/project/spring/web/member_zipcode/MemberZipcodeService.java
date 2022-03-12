package project.spring.web.member_zipcode;

import java.util.List;

public interface MemberZipcodeService {
	List<MemberZipcodeVO> getZipcodeAll(MemberZipcodeVO vo);
	int getZipcodeAmount(MemberZipcodeVO vo);
	int insertZipcode(MemberZipcodeVO vo);
	public int updateZipcodeDefaultAddress(MemberZipcodeVO vo);
}
