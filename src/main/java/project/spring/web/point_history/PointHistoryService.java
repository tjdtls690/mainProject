package project.spring.web.point_history;

import java.util.List;

public interface PointHistoryService {
	public int insertPointHistory(PointHistoryVO vo);
	public List<PointHistoryVO> selectMemberPointHistory(PointHistoryVO vo);
}
