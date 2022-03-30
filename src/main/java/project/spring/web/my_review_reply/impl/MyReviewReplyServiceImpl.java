package project.spring.web.my_review_reply.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.my_review_reply.MyReviewReplyService;
import project.spring.web.my_review_reply.MyReviewReplyVO;

@Service
public class MyReviewReplyServiceImpl implements MyReviewReplyService{
	@Autowired
	MyReviewReplyDAO myReviewReplyDAO;

	@Override
	public List<MyReviewReplyVO> getReviewReply() {
		return myReviewReplyDAO.getReviewReply();
	}
	
}
