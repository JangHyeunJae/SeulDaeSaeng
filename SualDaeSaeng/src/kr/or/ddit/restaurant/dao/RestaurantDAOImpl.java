package kr.or.ddit.restaurant.dao;

import java.util.List;
import java.util.Map;

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
	public List<RestaurantVO> selectRestaurantType(Map<String, Object> cls) {
		
		SqlSession session = null;
		List<RestaurantVO> restaurantList = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
			restaurantList =session.selectList("restaurant/restaurantList", cls);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return restaurantList;
	}

}
