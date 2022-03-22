package project.spring.web.md_recommand.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.md_recommand.MdRecommandService;
import project.spring.web.md_recommand.MdRecommandVO;

@Service
public class MdRecommandServiceImpl implements MdRecommandService{
	
	@Autowired
	MdRecommandDAO mdRecommandDAO;

	@Override
	public List<MdRecommandVO> getMd(MdRecommandVO vo) {
		return mdRecommandDAO.getMd(vo);
	}
	
	@Override
	public void deleteMd(MdRecommandVO vo) {
		mdRecommandDAO.deleteMd(vo);		
	}

	@Override
	public void mdInsert(MdRecommandVO vo) {
		mdRecommandDAO.mdInsert(vo);
	}
}
