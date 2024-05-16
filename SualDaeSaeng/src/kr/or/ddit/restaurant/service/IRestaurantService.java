package kr.or.ddit.restaurant.service;

import java.util.List;
import kr.or.ddit.restaurant.vo.RestaurantVO;

public interface IRestaurantService {
	public List<RestaurantVO> selectRestaurantType(String mcls);
	public List<RestaurantVO> selectRestaurantType(String mcls,String scls);
}
