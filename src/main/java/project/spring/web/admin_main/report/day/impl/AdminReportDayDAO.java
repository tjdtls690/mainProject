package project.spring.web.admin_main.report.day.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_main.report.day.AdminReportDayVO;

@Repository
public class AdminReportDayDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminReportDayVO> reportDay(AdminReportDayVO vo){
		System.out.println("-->mybatis reportDay");
		return sqlSessionTemplate.selectList("adminMainReportDayDAO.reportDay", vo);
	}
	
	public List<AdminReportDayVO> reportMonth(AdminReportDayVO vo){
		System.out.println("-->mybatis reportMonth");
		return sqlSessionTemplate.selectList("adminMainReportDayDAO.reportMonth", vo);
	}

}
