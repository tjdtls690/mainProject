package project.spring.web.point_history.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.point_history.PointHistoryVO;

@Repository
public class PointHistoryDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertPointHistory(PointHistoryVO vo) {
		return sqlSessionTemplate.insert("PointHistoryDAO.insertPointHistory", vo);
	}
	
	public List<PointHistoryVO> selectMemberPointHistory(PointHistoryVO vo) {
		return sqlSessionTemplate.selectList("PointHistoryDAO.selectMemberPointHistory", vo);
	}
}
