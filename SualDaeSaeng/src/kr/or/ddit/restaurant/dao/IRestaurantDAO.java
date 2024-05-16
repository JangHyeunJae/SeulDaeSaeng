package kr.or.ddit.restaurant.dao;

import java.util.List;

import kr.or.ddit.restaurant.vo.RestaurantVO;

public interface IRestaurantDAO {
	public List<RestaurantVO> selectRestaurantType(String mcls);
	public List<RestaurantVO> selectRestaurantType(String mcls,String scls);
}
