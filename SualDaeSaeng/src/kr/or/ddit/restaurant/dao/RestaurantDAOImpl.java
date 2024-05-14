package kr.or.ddit.restaurant.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.restaurant.vo.RestaurantVO;
import kr.or.ddit.util.MyBatisUtil;

public class RestaurantDAOImpl implements IRestaurantDAO{
	private static RestaurantDAOImpl instance = null;
	
	private RestaurantDAOImpl() {}
	
	public static RestaurantDAOImpl getInstance() {
		if(instance == null) {
			instance = new RestaurantDAOImpl();
		}
		return instance;
	}

	@Override
	public List<RestaurantVO> selectRestaurantType(String mcls) {
		SqlSession session = null;
		List<RestaurantVO> restaurantList = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return restaurantList;
	}

	@Override
	public List<RestaurantVO> selectRestaurantType(String mcls, String scls) {
		SqlSession session = null;
		List<RestaurantVO> restaurantList = null;
		
		if(scls.equals("")) selectRestaurantType(mcls);
		
		return restaurantList;
	}

}
