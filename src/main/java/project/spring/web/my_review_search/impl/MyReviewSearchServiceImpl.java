package project.spring.web.my_review_search.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.my_review_search.MyReviewSearchService;
import project.spring.web.my_review_write.MyReviewWriteVO;

@Service
public class MyReviewSearchServiceImpl implements MyReviewSearchService{
	
	@Autowired
	MyReviewSearchDAO myReviewSearchDAO;

	@Override
	public MyReviewWriteVO getPaymentItemMappingCodeReview(MyReviewWriteVO vo) {
		return myReviewSearchDAO.getPaymentItemMappingCodeReview(vo);
	}
	
}
