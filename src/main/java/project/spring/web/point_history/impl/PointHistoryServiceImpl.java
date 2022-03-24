package project.spring.web.point_history.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.point_history.PointHistoryService;
import project.spring.web.point_history.PointHistoryVO;

@Service
public class PointHistoryServiceImpl implements PointHistoryService{
	
	@Autowired
	PointHistoryDAO pointHistoryDAO;

	@Override
	public int insertPointHistory(PointHistoryVO vo) {
		return pointHistoryDAO.insertPointHistory(vo);
	}
	
}
