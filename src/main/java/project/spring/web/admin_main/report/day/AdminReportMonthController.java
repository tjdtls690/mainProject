package project.spring.web.admin_main.report.day;

import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.Calendar;
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

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Controller
public class AdminReportMonthController {
	
	@Autowired
	private AdminReportDayService adminReportDayService;
	
	// 엑셀로 내보내기
			@RequestMapping(value = "/excelDown2.mdo")
			public void excelDown(HttpServletResponse response) throws Exception {
				System.out.println("엑셀 ");
				// 날짜용 메서드
				LocalDate now = LocalDate.now();
				DecimalFormat df = new DecimalFormat("00");
		        Calendar currentCalendar = Calendar.getInstance();
				
		        // 이번 년도	--> 2022
		        int year = now.getYear();
		        //이번달		--> 03
		      	String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
				// 이번달 시작일
				String startDay = year+"-"+month+"-"+"01";
				// 이번달 마지막일
				int str = currentCalendar.getActualMaximum(Calendar.DAY_OF_MONTH);
				String endDay = year+"-"+month+"-"+str;
				
				
				
				
				AdminReportDayVO vo = new AdminReportDayVO();
				vo.setDate(startDay);
				vo.setImpl(endDay);
				List<AdminReportDayVO> list = adminReportDayService.reportMonth(vo);
				
				
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
			    

			    // 컨텐츠 타입과 파일명 지정
			    response.setContentType("ms-vnd/excel");
			    response.setHeader("Content-Disposition", "attachment;filename=daily_sales_report.xls");

			    // 엑셀 출력
			    wb.write(response.getOutputStream());
			    wb.close();

			}
			
		// pdf로 내보내기	
			@RequestMapping("/pdfDown2.mdo")
			public void pdfDown()throws Exception{
				System.out.println("pdfDown 접근");
				
		        try {
		            Document document = new Document(); // pdf문서를 처리하는 객체
		 
		            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("C:\\금달 매출.pdf"));
		            // pdf파일의 저장경로를 d드라이브의 sample.pdf로 한다는 뜻
		 
		            document.open(); // 웹페이지에 접근하는 객체를 연다
		 
		            BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H,
		                    BaseFont.EMBEDDED);
		            // pdf가 기본적으로 한글처리가 안되기 때문에 한글폰트 처리를 따로 해주어야 한다.
		            // createFont메소드에 사용할 폰트의 경로 (malgun.ttf)파일의 경로를 지정해준다.
		            // 만약에 이 경로에 없을 경우엔 java파일로 만들어서 집어넣어야 한다.
		 
		            Font font = new Font(baseFont, 9); // 폰트의 사이즈를 12픽셀로 한다.
		            Font title = new Font(baseFont, 15);
		            
		            PdfPTable table = new PdfPTable(9); // 9개의 셀을 가진 테이블 객체를 생성 (pdf파일에 나타날 테이블)
		            Chunk chunk = new Chunk("금주 매출", title); // 타이틀 객체를 생성 (타이틀의 이름을 장바구니로 하고 위에 있는 font를 사용)
		            Paragraph ph = new Paragraph(chunk);
		            ph.setAlignment(Element.ALIGN_CENTER);
		            document.add(ph); // 문단을 만들어서 가운데 정렬 (타이틀의 이름을 가운데 정렬한다는 뜻)
		 
		            document.add(Chunk.NEWLINE); // 줄바꿈 (왜냐하면 타이틀에서 두줄을 내린후에 셀(테이블)이 나오기 때문)
		 
		            PdfPCell cell1 = new PdfPCell(new Phrase("날짜", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
		            cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)
		 
		            PdfPCell cell2 = new PdfPCell(new Phrase("총 판매수", font));
		            cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
		 
		            PdfPCell cell3 = new PdfPCell(new Phrase("할인전", font));
		            cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		 
		            PdfPCell cell4 = new PdfPCell(new Phrase("배송비", font));
		            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
		            
		            PdfPCell cell5 = new PdfPCell(new Phrase("총 가격", font));
		            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
		            
		            PdfPCell cell6 = new PdfPCell(new Phrase("쿠폰 가", font));
		            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
		            
		            PdfPCell cell7 = new PdfPCell(new Phrase("포인트 ", font));
		            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
		            
		            PdfPCell cell8 = new PdfPCell(new Phrase("할인가격", font));
		            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
		            
		            PdfPCell cell9 = new PdfPCell(new Phrase("결제금액", font));
		            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
		            
		            table.addCell(cell1); // 그리고 테이블에 위에서 생성시킨 셀을 넣는다.
		            table.addCell(cell2);
		            table.addCell(cell3);
		            table.addCell(cell4);
		            table.addCell(cell5);
		            table.addCell(cell6);
		            table.addCell(cell7);
		            table.addCell(cell8);
		            table.addCell(cell9);
		            
					// 날짜용 메서드
					LocalDate now = LocalDate.now();
					DecimalFormat df = new DecimalFormat("00");
			        Calendar currentCalendar = Calendar.getInstance();
					
			        // 이번 년도	--> 2022
			        int year = now.getYear();
			        //이번달		--> 03
			      	String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
					// 이번달 시작일
					String startDay = year+"-"+month+"-"+"01";
					// 이번달 마지막일
					int str = currentCalendar.getActualMaximum(Calendar.DAY_OF_MONTH);
					String endDay = year+"-"+month+"-"+str;
					
					AdminReportDayVO vo = new AdminReportDayVO();
					vo.setDate(startDay);
					vo.setImpl(endDay);
		
		            List<AdminReportDayVO> list = adminReportDayService.reportMonth(vo);
		            
		            for(int i=0; i < list.size(); i++) {
		            	System.out.println("for문 실행");
		            	System.out.println(i+"번째 날짜 : "+list.get(i).getDate());
		            	PdfPCell date = new PdfPCell(new Phrase(list.get(i).getDate(), font));
		            	PdfPCell count = new PdfPCell(new Phrase(list.get(i).getCount(), font));
		            	PdfPCell price = new PdfPCell(new Phrase(list.get(i).getPrice(), font));
		            	PdfPCell delivery = new PdfPCell(new Phrase(list.get(i).getDelivery(), font));
		            	PdfPCell priceSum = new PdfPCell(new Phrase(list.get(i).getPriceSum(), font));
		            	PdfPCell priceCoupon = new PdfPCell(new Phrase(list.get(i).getPriceCoupon(), font));
		            	PdfPCell pricePoint = new PdfPCell(new Phrase(list.get(i).getPricepoint(), font));
		            	PdfPCell priceSail = new PdfPCell(new Phrase(list.get(i).getPriceSail(), font));
		            	PdfPCell priceFinal = new PdfPCell(new Phrase(list.get(i).getPriceFinal(), font));

		            	table.addCell(date);
		            	table.addCell(count);
		            	table.addCell(price);
		            	table.addCell(delivery);
		            	table.addCell(priceSum);
		            	table.addCell(priceCoupon);
		            	table.addCell(pricePoint);
		            	table.addCell(priceSail);
		            	table.addCell(priceFinal);

		            }
		       // 일주일치 총 합계 량 구하기    
//		            int count = 0;
//		            int price = 0;
//		            int delivery = 0;
//		            int priceSum = 0;
//		            int priceCoupon = 0;
//		            int pricePoint = 0;
//		            int priceSail = 0;
//		            int priceFinal = 0;
//		            
//		            for(int i = 0; i<list.size(); i++) {
//		            	count += Integer.parseInt(list.get(i).getCount());
//		            	price += Integer.parseInt(list.get(i).getPrice());
//		            	delivery += Integer.parseInt(list.get(i).getDelivery());
//		            	priceSum += Integer.parseInt(list.get(i).getPriceSum());
//		            	priceCoupon += Integer.parseInt(list.get(i).getPriceCoupon());
//		            	pricePoint += Integer.parseInt(list.get(i).getPricepoint());
//		            	priceSail += Integer.parseInt(list.get(i).getPriceSail());
//		            	priceFinal += Integer.parseInt(list.get(i).getPriceFinal());
//		          	
//		            }
//		            
//	            	PdfPCell date = new PdfPCell(new Phrase("", font));
//	            	PdfPCell count2 = new PdfPCell(new Phrase(""+count, font));
//	            	PdfPCell price2 = new PdfPCell(new Phrase(""+price, font));
//	            	PdfPCell delivery2 = new PdfPCell(new Phrase(""+delivery, font));
//	            	PdfPCell priceSum2 = new PdfPCell(new Phrase(""+priceSum, font));
//	            	PdfPCell priceCoupon2 = new PdfPCell(new Phrase(""+priceCoupon, font));
//	            	PdfPCell pricePoint2 = new PdfPCell(new Phrase(""+pricePoint, font));
//	            	PdfPCell priceSail2 = new PdfPCell(new Phrase(""+priceSail, font));
//	            	PdfPCell priceFinal2 = new PdfPCell(new Phrase(""+priceFinal, font));
//	            	
//	            	table.addCell(date);
//	            	table.addCell(count2);
//	            	table.addCell(price2);
//	            	table.addCell(delivery2);
//	            	table.addCell(priceSum2);
//	            	table.addCell(priceCoupon2);
//	            	table.addCell(pricePoint2);
//	            	table.addCell(priceSail2);
//	            	table.addCell(priceFinal2);

		            
		            

		            document.add(table); // 웹접근 객체에 table를 저장한다.
		            document.close(); // 저장이 끝났으면 document객체를 닫는다.
		            System.out.println("성공");
			
		        }catch (Exception e) {
		        	System.out.println("실패");
		            e.printStackTrace();
		        }
			}

}
