package project.spring.web.tapPage;

import java.util.List;

public interface TapPageService {
	List<TapPageVO> getItemInfo(TapPageVO vo);
	
	TapPageVO getAvgCount(TapPageVO vo);
}
