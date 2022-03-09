package project.spring.web.event;

import java.util.List;

public interface EventService {
	
	public List<CouponVO> getCoupon(CouponVO vo);
	
	public void insertCoupon(CouponVO vo);
	
	public List<CouponVO> getCouponPack(CouponVO vo);
}
