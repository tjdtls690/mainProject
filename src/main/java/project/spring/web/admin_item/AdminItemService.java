package project.spring.web.admin_item;

import java.util.List;

public interface AdminItemService {
	public List<AdminItemVO> getAdminItemList(AdminItemVO vo);
	public List<AdminSubVO> getAdminSubList(AdminSubVO vo);
	public void itemDelete(AdminItemVO vo);
	public void subDelete(AdminSubVO vo);
	public void itemInsert(AdminItemVO vo);
}
