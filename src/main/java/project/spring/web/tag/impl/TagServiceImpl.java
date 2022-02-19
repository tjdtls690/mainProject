package project.spring.web.tag.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.tag.TagService;
import project.spring.web.tag.TagVO;

@Service
public class TagServiceImpl implements TagService{
	
	@Autowired
	TagDAO tagDAO;

	@Override
	public List<TagVO> getTagInfo(TagVO vo) {
		return tagDAO.getTagList(vo);
	}

}
