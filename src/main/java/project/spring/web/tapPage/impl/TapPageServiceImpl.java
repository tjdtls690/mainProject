package project.spring.web.tapPage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.tapPage.TapPageService;
import project.spring.web.tapPage.TapPageVO;

@Service
public class TapPageServiceImpl implements TapPageService{
	
	@Autowired
	TapPageDAO tapPageDAO;

	@Override
	public List<TapPageVO> getItemInfo(TapPageVO vo) {
			if(vo.getTagMain() / 100 != 1 && vo.getTagMain() / 100 != 6) return tapPageDAO.getItemInfo01(vo);
			else return tapPageDAO.getItemInfo02(vo);
	}
	
}
