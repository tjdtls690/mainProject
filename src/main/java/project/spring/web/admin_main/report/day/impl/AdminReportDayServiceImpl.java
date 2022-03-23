package project.spring.web.admin_main.report.day.impl;

import java.io.FileOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

import project.spring.web.admin_main.report.day.AdminReportDayService;
import project.spring.web.admin_main.report.day.AdminReportDayVO;

@Service
public class AdminReportDayServiceImpl implements AdminReportDayService {

	@Autowired
	AdminReportDayDAO adminReportDayDAO;
	
	@Override
	public List<AdminReportDayVO> reportDay(AdminReportDayVO vo) {
		
		return adminReportDayDAO.reportDay(vo);
	}
	
}
