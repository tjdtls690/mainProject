package project.spring.web.admin_statistics;

import java.util.List;

public interface AdminStatisticsService {
	
	List<AdminStatisticsVO> getWeek(AdminStatisticsVO vo);
	
	List<AdminStatisticsVO> getMonth(AdminStatisticsVO vo);
	
	List<AdminStatisticsVO> getMonth3(AdminStatisticsVO vo);
	
	List<AdminStatisticsVO> getMonth6(AdminStatisticsVO vo);

}
