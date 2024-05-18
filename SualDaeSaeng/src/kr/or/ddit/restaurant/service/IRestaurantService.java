package kr.or.ddit.restaurant.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.restaurant.vo.RestaurantVO;

public interface IRestaurantService {
	public List<RestaurantVO> selectRestaurantType(Map<String, Object> cls);
	public int selectRestaurantTypeTotal(Map<String, Object> cls);
	public String selectMclsName(Map<String, Object> cls);
	public String selectSclsName(Map<String, Object> cls);
	public List<RestaurantVO> selectMclsList();
	public List<RestaurantVO> selectSclsList(String mcls);
	public RestaurantVO selectRest(String bizno);
}
