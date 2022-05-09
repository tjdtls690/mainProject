package com.pdf.web;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.itextpdf.text.Element;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

import project.spring.web.admin_main.report.day.AdminReportDayVO;

public class PdfDownView extends AbstractPdfView {

   //첫번째 매개변수가 Controller가 넘겨준 데이터 
   //두번째 매개변수는 출력할 문서
   @Override
   protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer, HttpServletRequest request,HttpServletResponse response) throws Exception {
      
      List<AdminReportDayVO> list = (List<AdminReportDayVO>)model.get("list");
      XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
      //테이블을 생성
      //1열 list.size()+1 행으로 생성
      Table table = new Table(9);
      System.out.println(list.get(0).getCount() + " " + list.get(0).getDelivery());
 
      //여백 설정
      table.setPadding(9);
      
      // CSS
      CSSResolver cssResolver = new StyleAttrCSSResolver();
   //   CssFile cssFile = helper.getCSS(new FileInputStream());
   //   cssResolver.addCss(cssFile);
      
      // 기본 폰트 설정 - 폰트에 따라 한글 출력 여부가 결정된다.
   //   BaseFont bfKorea = BaseFont.createFont("C:\\Windows\\Fonts\\batang.ttc,0",BaseFont.IDENTITY_H,BaseFont.EMBEDDED);
      String path =request.getSession().getServletContext().getRealPath("/");
      BaseFont baseFont= BaseFont.createFont(path +"/resources/pdfFresh/fresh.ttf".replace('/', File.separatorChar), BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
      Font font = new Font(baseFont,9);
      
      Cell cell1 = new Cell(new Paragraph("날짜", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
      cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)

      Cell cell2 = new Cell(new Paragraph("총 판매수", font));
      cell2.setHorizontalAlignment(Element.ALIGN_CENTER);

      Cell cell3 = new Cell(new Paragraph("할인전", font));
      cell3.setHorizontalAlignment(Element.ALIGN_CENTER);

      Cell cell4 = new Cell(new Paragraph("배송비", font));
      cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
      
      Cell cell5 = new Cell(new Paragraph("총 가격", font));
      cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
      
      Cell cell6 = new Cell(new Paragraph("쿠폰 가", font));
      cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
      
      Cell cell7 = new Cell(new Paragraph("포인트 ", font));
      cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
      
      Cell cell8 = new Cell(new Paragraph("할인가격", font));
      cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
      
      Cell cell9 = new Cell(new Paragraph("결제금액", font));
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
      
      for(int i=0; i < list.size(); i++) {
      	System.out.println("for문 실행");
      	System.out.println(i+"번째 날짜 : "+list.get(i).getDate());
      	System.out.println(i+"번째 날짜 : "+list.get(i).getPrice());
      	Cell date = new Cell(new Paragraph(list.get(i).getDate(), font));
      	Cell count = new Cell(new Paragraph(list.get(i).getCount(), font));
      	Cell price = new Cell(new Paragraph(list.get(i).getPrice(), font));
      	Cell delivery = new Cell(new Paragraph(list.get(i).getDelivery(), font));
      	Cell priceSum = new Cell(new Paragraph(list.get(i).getPriceSum(), font));
      	Cell priceCoupon = new Cell(new Paragraph(list.get(i).getPriceCoupon(), font));
      	Cell pricePoint = new Cell(new Paragraph(list.get(i).getPricepoint(), font));
      	Cell priceSail = new Cell(new Paragraph(list.get(i).getPriceSail(), font));
      	Cell priceFinal = new Cell(new Paragraph(list.get(i).getPriceFinal(), font));

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
//      Cell cell1 = new Cell(new Paragraph("첫 줄",font));
//      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
//      table.addCell(cell1);
//      Cell cell2 = new Cell(new Paragraph("두번째 줄",font));
//      cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
//      table.addCell(cell2);
      
//      Cell cell3 = new Cell(new Paragraph(list.get(0),font));
//      table.addCell(cell3);
//      Cell cell4 = new Cell(new Paragraph(list.get(1),font));
//      table.addCell(cell4);

      
      //데이터를 테이블의 셀에 출력
//      for(String language : list){
//         Cell imsi = new Cell(new Paragraph(language,font));
//         table.addCell(imsi);
//      }
      
      //문서에 테이블 추가
      doc.add(table);

   }

}
