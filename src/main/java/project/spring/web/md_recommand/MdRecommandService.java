package project.spring.web.md_recommand;

import java.util.List;

public interface MdRecommandService {
	public List<MdRecommandVO> getMd(MdRecommandVO vo);
	
	public void deleteMd(MdRecommandVO vo);
	
	public void mdInsert(MdRecommandVO vo);
}
