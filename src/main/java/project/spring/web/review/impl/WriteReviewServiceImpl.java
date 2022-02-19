package project.spring.web.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.review.WriteReviewService;
import project.spring.web.review.WriteReviewVO;

@Service
public class WriteReviewServiceImpl implements WriteReviewService{
	
	@Autowired
	WriteReviewDAO writeReviewDAO;

	@Override
	public void insertReview(WriteReviewVO vo) {
		writeReviewDAO.insertReview(vo);
	}

	@Override
	public void updateReview(WriteReviewVO vo) {
		writeReviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(WriteReviewVO vo) {
		writeReviewDAO.deleteReview(vo);
	}

	@Override
	public WriteReviewVO getReview(WriteReviewVO vo) {
		return writeReviewDAO.getReview(vo);
	}

	@Override
	public List<WriteReviewVO> getReviewList(WriteReviewVO vo) {
		return writeReviewDAO.getReviewList(vo);
	}

}
