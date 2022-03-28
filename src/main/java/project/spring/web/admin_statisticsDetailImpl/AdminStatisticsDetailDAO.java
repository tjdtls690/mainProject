package project.spring.web.admin_statisticsDetailImpl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.spring.web.admin_statisticsDetail.AdminStatisticsDetailVO;

@Repository
public class AdminStatisticsDetailDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<AdminStatisticsDetailVO> getItemReportDetail(AdminStatisticsDetailVO vo){
		System.out.println("---> myBatis getItemReportDetail");
		return sqlSessionTemplate.selectList("adminStatisticsDetailDAO.getItemReportDetail",vo);
		
	}
	public List<AdminStatisticsDetailVO> getSetReportDetail(AdminStatisticsDetailVO vo){
		System.out.println("---> myBatis getItemReportDetail");
		return sqlSessionTemplate.selectList("adminStatisticsDetailDAO.getSetReportDetail",vo);
		
	}
	
	public List<AdminStatisticsDetailVO> getHowManyDetault(AdminStatisticsDetailVO vo){
		System.out.println("---> myBatis getItemReportDetail");
		return sqlSessionTemplate.selectList("adminStatisticsDetailDAO.getHowManyDetault",vo);
		
	}
	
	public List<AdminStatisticsDetailVO> getTagMainRank(AdminStatisticsDetailVO vo){
		System.out.println("---> myBatis getTagMainRank");
		return sqlSessionTemplate.selectList("adminStatisticsDetailDAO.getTagMainRank",vo);
		
	}
	
	public List<AdminStatisticsDetailVO> getTagMainRank2(AdminStatisticsDetailVO vo){
		System.out.println("---> myBatis getTagMainRank2");
		return sqlSessionTemplate.selectList("adminStatisticsDetailDAO.getTagMainRank2",vo);
		
	}
	
	public List<AdminStatisticsDetailVO> getSummary(AdminStatisticsDetailVO vo){
		System.out.println("---> myBatis getSummary");
		return sqlSessionTemplate.selectList("adminStatisticsDetailDAO.getSummary",vo);
		
	}

}
