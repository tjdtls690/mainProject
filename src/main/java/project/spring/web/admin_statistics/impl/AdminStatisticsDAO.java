package project.spring.web.admin_statistics.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_statistics.AdminStatisticsVO;

@Repository
public class AdminStatisticsDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminStatisticsVO> getWeek(AdminStatisticsVO vo){
		System.out.println("--> myBatis getWeek");
		return sqlSessionTemplate.selectList("adminStatisticsDAO.getWeek",vo);
		
	}
	
	public List<AdminStatisticsVO> getMonth(AdminStatisticsVO vo){
		System.out.println("--> myBatis getMonth");
		return sqlSessionTemplate.selectList("adminStatisticsDAO.getMonth",vo);
		
	}
	
	public List<AdminStatisticsVO> getMonth3(AdminStatisticsVO vo){
		System.out.println("--> myBatis getMonth");
		return sqlSessionTemplate.selectList("adminStatisticsDAO.getMonth3",vo);
		
	}
	
	public List<AdminStatisticsVO> getMonth6(AdminStatisticsVO vo){
		System.out.println("--> myBatis getMonth6");
		return sqlSessionTemplate.selectList("adminStatisticsDAO.getMonth6",vo);
		
	}


}
