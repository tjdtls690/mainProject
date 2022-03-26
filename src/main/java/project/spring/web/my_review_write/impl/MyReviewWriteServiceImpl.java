package project.spring.web.my_review_write.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.my_review_write.MyReviewWriteService;
import project.spring.web.my_review_write.MyReviewWriteVO;
import project.spring.web.paymentComplete.PaymentMyDetailInfoVO;
import project.spring.web.utill.Criteria;
import project.spring.web.utill.PageMaker;

@Service
public class MyReviewWriteServiceImpl implements MyReviewWriteService{
	
	@Autowired
	MyReviewWriteDAO writeReviewDAO;

	@Override
	public void insertReview(MyReviewWriteVO vo) {
		writeReviewDAO.insertReview(vo);
	}
	
	@Override
	public int insertSubReview(MyReviewWriteVO vo) {
		return writeReviewDAO.insertSubReview(vo);
	}

	@Override
	public void updateReview(MyReviewWriteVO vo) {
		writeReviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(MyReviewWriteVO vo) {
		writeReviewDAO.deleteReview(vo);
	}

	@Override
	public MyReviewWriteVO getReview(MyReviewWriteVO vo) {
		return writeReviewDAO.getReview(vo);
	}
	
	@Override
	public List<MyReviewWriteVO> getReviewList(MyReviewWriteVO vo) {
		System.out.println(vo.getTagMain());
		System.out.println(vo.getItem_code());
		if(vo.getTagMain() / 100 != 1 && vo.getTagMain() / 100 != 6) return writeReviewDAO.getReviewList01(vo);
		return writeReviewDAO.getReviewList02(vo);
	}
// 페이징 처리	
	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
	    return writeReviewDAO.selectBoardList(cri);
	}
	
	@Override
	public List<Map<String, Object>> selectBoardList2(Criteria cri) {
	    return writeReviewDAO.selectBoardList2(cri);
	}
	
	@Override
	public int countBoardListTotal(PageMaker pageMaker) {
		System.out.println("countBoardListTotal serviceImpl");
		return writeReviewDAO.countBoardList(pageMaker);
	}
	
	@Override
	public int countBoardListTotal2(PageMaker pageMaker) {
		System.out.println("countBoardListTotal2 serviceImpl");
		return writeReviewDAO.countBoardList2(pageMaker);
	}

	@Override
	public PaymentMyDetailInfoVO getMemberPayMappingItemInfoOne(PaymentMyDetailInfoVO vo) {
		return writeReviewDAO.getMemberPayMappingItemInfoOne(vo);
	}
	
}
