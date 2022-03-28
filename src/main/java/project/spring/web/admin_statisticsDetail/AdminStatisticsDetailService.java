package project.spring.web.admin_statisticsDetail;

import java.util.List;

public interface AdminStatisticsDetailService {
	
	List<AdminStatisticsDetailVO> getItemReportDetail(AdminStatisticsDetailVO vo);
	
	List<AdminStatisticsDetailVO> getSetReportDetail(AdminStatisticsDetailVO vo);
	
	List<AdminStatisticsDetailVO> getHowManyDetault(AdminStatisticsDetailVO vo);
	
	List<AdminStatisticsDetailVO> getTagMainRank(AdminStatisticsDetailVO vo);
	
	List<AdminStatisticsDetailVO> getTagMainRank2(AdminStatisticsDetailVO vo);
	
	List<AdminStatisticsDetailVO> getSummary(AdminStatisticsDetailVO vo);
	

}
