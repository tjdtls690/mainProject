package project.spring.web.admin_main_chart;

import java.util.List;

public interface AdminMainChartService {
	
	// List<Map<String, Object>> dayChart();

	List<AdminMainChartVO> dayChart(AdminMainChartVO vo);
	
	List<AdminMainChartVO> getDayChart(AdminMainChartVO vo);
	
	List<AdminMainChartVO> getDayChart2(AdminMainChartVO vo);
	
	List<AdminMainChartVO> getMonthChart(AdminMainChartVO vo);
	
	List<AdminMainChartVO> getMonthChart2(AdminMainChartVO vo);
	
	
	

}
