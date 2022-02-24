package project.spring.web.tapPage;

import java.util.List;

public interface TapPageService {
	List<TapPageVO> getItemInfo(TapPageVO vo);
	
	TapPageVO getAvgCount(TapPageVO vo);
//	슬라이드용 랜덤 정보 추출
	List<TapPageVO> getRandom(TapPageVO vo);
}
