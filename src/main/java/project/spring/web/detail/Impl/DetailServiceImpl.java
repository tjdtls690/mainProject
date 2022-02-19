package project.spring.web.detail.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.detail.DetailService;
import project.spring.web.detail.DetailVO;

@Service("detailService")
public class DetailServiceImpl implements DetailService {
	@Autowired
	DetailDAO detailDAO;

	@Override
	public DetailVO getDetail(DetailVO vo) {
		System.out.println("getDetail 실행");
		return detailDAO.getDetail(vo);
	}
}
