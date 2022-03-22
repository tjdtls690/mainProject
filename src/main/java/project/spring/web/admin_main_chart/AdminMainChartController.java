package project.spring.web.admin_main_chart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainChartController {
	
	@Autowired
	private AdminMainChartService adminMainChartService;
	
	@RequestMapping("/adminMainChart.mdo")
	public ModelAndView adminMainChartDo(ModelAndView mav) {
		
		List<AdminMainChartVO> dayChartList = adminMainChartService.dayChart(null);
//	값이 잘 넘어오는지 테스트
		for(int i=0; i<13; i++) {
//			System.out.println("라인차트");
//			System.out.print(i+"번째 date : "+dayChartList.get(i).getDate());
//			System.out.print(i+"번째 sum : "+dayChartList.get(i).getDaySum());
			
			mav.addObject("check"+i, dayChartList.get(i).getDaySum());
		}
		mav.addObject("startDay2",dayChartList.get(0).getDate());
		mav.addObject("startDay", dayChartList.get(12).getDate());
		mav.addObject("dayChart", dayChartList);
		
		// 바 차트에 처음 보여줄 값
		List<AdminMainChartVO> monthChartList = adminMainChartService.getMonthChart(null);
		for(int i=0; i<12; i++) {
//			System.out.println("바차트");
//			System.out.println(i+"번째 date : "+monthChartList.get(i).getDate());
//			System.out.println(i+"번째 sum : "+monthChartList.get(i).getDaySum());
			mav.addObject("month"+i, monthChartList.get(i).getDaySum());
		}
		
		
		mav.setViewName("mainChart");
		return mav;
	}
	
	// 라인차트 +버튼
	@RequestMapping("/next.mdo")
	public ModelAndView nextDay(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("theDay");

		AdminMainChartVO vo = new AdminMainChartVO();
		vo.setDate(str);
		
		List<AdminMainChartVO> dayChartList = adminMainChartService.getDayChart(vo);

		
		mav.addObject("chart", dayChartList);
		mav.setViewName("mainForLine");
		return mav;
	}
	
	// 라인차트 -버튼
	@RequestMapping("/prev.mdo")
	public ModelAndView prevDay(HttpServletRequest request, ModelAndView mav) {
		String str = request.getParameter("theDay");

		AdminMainChartVO vo = new AdminMainChartVO();
		vo.setDate(str);
		
		List<AdminMainChartVO> dayChartList = adminMainChartService.getDayChart2(vo);
		
		
		mav.addObject("chart", dayChartList);
		mav.setViewName("mainForLine");
		return mav;
	}

	// 바 차트 오른쪽 버튼
	@RequestMapping("/nextMonth.mdo")
	public ModelAndView nextMonth(HttpServletRequest request,ModelAndView mav) {
		String str = request.getParameter("setYear");
		System.out.println("오른쪽버튼"+str);
		
		// 바 차트에 처음 보여줄 값
		List<AdminMainChartVO> monthChartList = adminMainChartService.getMonthChart2(null);
//		for(int i=0; i<12; i++) {
//			mav.addObject("month", monthChartList.get(i).getDaySum());
//			System.out.println("2022 가격 : "+monthChartList.get(i).getDaySum());
//		}		
		mav.addObject("month",monthChartList);
		mav.setViewName("mainForBar");
		return mav;
	}
	
	// 바 차트 왼쪽 버튼
	@RequestMapping("/prevMonth.mdo")
	public ModelAndView prevMonth(HttpServletRequest request,ModelAndView mav) {
		String str = request.getParameter("setYear");
		System.out.println(str);
		
		// 바 차트에 처음 보여줄 값
		List<AdminMainChartVO> monthChartList = adminMainChartService.getMonthChart(null);
//		for(int i=0; i<12; i++) {
//			mav.addObject("month", monthChartList.get(i).getDaySum());
//			System.out.println("2021 가격 : "+monthChartList.get(i).getDaySum());
//		}		
		
		mav.addObject("month",monthChartList);
		mav.setViewName("mainForBar");
		return mav;
	}
	
	// 엑셀로 내보내기
	@RequestMapping(value = "/excelDown.mdo")
	public void excelDown(HttpServletResponse response) throws Exception {
		System.out.println("엑셀 ");
	    // 날짜 조회
	   

	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("게시판");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색은 노란색입니다.
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("날짜");
	    
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("판매 건수");
	    
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("원 가");
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("배송비");
	    
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("총가격");
	    
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("쿠폰가");
	    
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("포인트사용");
	    
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("할인");
	    
	    cell = row.createCell(8);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("결제 금액");

	    // 데이터 부분 생성

//	    for(BoardVO vo : list) {
//	        row = sheet.createRow(rowNo++);
//	        cell = row.createCell(0);
//	        cell.setCellStyle(bodyStyle);
//	        cell.setCellValue(vo.getNum());
//	        cell = row.createCell(1);
//	        cell.setCellStyle(bodyStyle);
//	        cell.setCellValue(vo.getName());
//	        cell = row.createCell(2);
//	        cell.setCellStyle(bodyStyle);
//	        cell.setCellValue(vo.getTitle());
//	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=daily_sales_report.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();

	}


	
	
	
}
