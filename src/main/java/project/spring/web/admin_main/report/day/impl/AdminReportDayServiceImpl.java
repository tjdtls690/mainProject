package project.spring.web.admin_main.report.day.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import project.spring.web.admin_main.report.day.AdminReportDayService;
import project.spring.web.admin_main.report.day.AdminReportDayVO;

@Service
public class AdminReportDayServiceImpl implements AdminReportDayService {

	@Autowired
	AdminReportDayDAO adminReportDayDAO;
	
	@Override
	public List<AdminReportDayVO> reportDay(AdminReportDayVO vo) {
		
		return adminReportDayDAO.reportDay(vo);
	}

	@Override
	public List<AdminReportDayVO> reportMonth(AdminReportDayVO vo) {
		
		return adminReportDayDAO.reportMonth(vo);
	}
	
}
