package kr.or.ddit.restaurant.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.restaurant.vo.RestaurantVO;

public interface IRestaurantDAO {
	public List<RestaurantVO> selectRestaurantType(Map<String, Object> cls);
}
