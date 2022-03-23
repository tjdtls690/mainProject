package project.spring.web.admin_main.report.day;

import java.util.List;

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

@Controller
public class AdminReportDayController {
	
	@Autowired
	private AdminReportDayService adminReportDayService;
	
	// 엑셀로 내보내기
		@RequestMapping(value = "/excelDown.mdo")
		public void excelDown(HttpServletResponse response) throws Exception {
			System.out.println("엑셀 ");
		    // 날짜 는 2022-03-23 기준으로 하겠다.
			List<AdminReportDayVO> list = adminReportDayService.reportDay(null);
			
			
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
		    
		    
		    for(int i=0; i <list.size(); i++) {
		    	row = sheet.createRow(rowNo++);
		    	cell =row.createCell(0);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getDate());
		    	
		    	cell =row.createCell(1);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getCount());
		    	
		    	cell =row.createCell(2);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPrice());
		    	
		    	cell =row.createCell(3);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getDelivery());
		    	
		    	cell =row.createCell(4);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPriceSum());
		    	
		    	cell =row.createCell(5);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPriceCoupon());
		    	
		    	cell =row.createCell(6);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPricepoint());
		    	
		    	cell =row.createCell(7);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPriceSail());
		    	
		    	cell =row.createCell(8);
		    	cell.setCellStyle(bodyStyle);
		    	cell.setCellValue(list.get(i).getPriceFinal());
		    }
		    

//		    for(BoardVO vo : list) {
//		        row = sheet.createRow(rowNo++);
		    
//		        cell = row.createCell(0);
//		        cell.setCellStyle(bodyStyle);
//		        cell.setCellValue(vo.getNum());
		    
//		        cell = row.createCell(1);
//		        cell.setCellStyle(bodyStyle);
//		        cell.setCellValue(vo.getName());
		    
//		        cell = row.createCell(2);
//		        cell.setCellStyle(bodyStyle);
//		        cell.setCellValue(vo.getTitle());
//		    }

		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    response.setHeader("Content-Disposition", "attachment;filename=daily_sales_report.xls");

		    // 엑셀 출력
		    wb.write(response.getOutputStream());
		    wb.close();

		}

}
