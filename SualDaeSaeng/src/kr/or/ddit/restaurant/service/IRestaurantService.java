package kr.or.ddit.restaurant.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.restaurant.vo.RestaurantVO;

public interface IRestaurantService {
	public List<RestaurantVO> selectRestaurantType(Map<String, Object> cls);
}
