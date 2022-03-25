package project.spring.web.admin_item_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.spring.web.admin_item.AdminItemInfoVO;
import project.spring.web.admin_item.AdminItemService;
import project.spring.web.admin_item.AdminItemVO;
import project.spring.web.admin_item.AdminSubVO;

@Service
public class AdminItemServiceImpl implements AdminItemService {
	
	@Autowired
	AdminItemDAO adminItemDAO;
	
	@Override
	public List<AdminItemVO> getAdminItemList(AdminItemVO vo) {
		return adminItemDAO.getAdminItemList(vo);
	}

	@Override
	public List<AdminSubVO> getAdminSubList(AdminSubVO vo) {
		return adminItemDAO.getAdminSubList(vo);
	}

	@Override
	public void itemDelete(AdminItemVO vo) {
		adminItemDAO.itemDelete(vo);
	}

	@Override
	public void subDelete(AdminSubVO vo) {
		adminItemDAO.subDelete(vo);
	}

	@Override
	public void itemInsert(AdminItemVO vo) {
		adminItemDAO.itemInsert(vo);
	}

	@Override
	public void itemInfoInsert(AdminItemInfoVO vo) {
		adminItemDAO.itemInfoInsert(vo);
	}
}
