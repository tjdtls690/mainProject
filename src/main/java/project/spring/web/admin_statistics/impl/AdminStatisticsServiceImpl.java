package project.spring.web.admin_statistics.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.admin_statistics.AdminStatisticsService;
import project.spring.web.admin_statistics.AdminStatisticsVO;

@Service
public class AdminStatisticsServiceImpl implements AdminStatisticsService {

	@Autowired
	AdminStatisticsDAO adminStatisticsDAO;
	
	@Override
	public List<AdminStatisticsVO> getWeek(AdminStatisticsVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDAO.getWeek(vo);
	}

	@Override
	public List<AdminStatisticsVO> getMonth(AdminStatisticsVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDAO.getMonth(vo);
	}
	
	@Override
	public List<AdminStatisticsVO> getMonth3(AdminStatisticsVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDAO.getMonth3(vo);
	}

	@Override
	public List<AdminStatisticsVO> getMonth6(AdminStatisticsVO vo) {
		// TODO Auto-generated method stub
		return adminStatisticsDAO.getMonth6(vo);
	}

}
