package kr.or.ddit.restaurant.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
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
			restaurantList = session.selectList("restaurant.restaurantList", cls);
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
	public int selectRestaurantTypeTotal(Map<String, Object> cls) {
		SqlSession session = null;
		int total = 0;
		try {
			session = MyBatisUtil.getSqlSession(true);
			total = session.selectOne("restaurant.restaurantTypeTotal", cls);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}		
		return total;
	}

	@Override
	public String selectMclsName(Map<String, Object> cls) {
		SqlSession session = null;
		String name = "";
		try {
			session = MyBatisUtil.getSqlSession(true);
			name = session.selectOne("restaurant.selectMslsName", cls);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}		
		return name;
	}

	@Override
	public String selectSclsName(Map<String, Object> cls) {
		SqlSession session = null;
		String name = "";
		try {
			session = MyBatisUtil.getSqlSession(true);
			name = session.selectOne("restaurant.selectSslsName", cls);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}		
		return name;
	}

	@Override
	public List<RestaurantVO> selectMclsList() {
		SqlSession session = null;
		List<RestaurantVO> selectMclsList = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
			selectMclsList = session.selectList("restaurant.selectMclsList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return selectMclsList;
	}

	@Override
	public List<RestaurantVO> selectSclsList(String mcls) {
		SqlSession session = null;
		List<RestaurantVO> selectSclsList = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
			selectSclsList = session.selectList("restaurant.selectSclsList",mcls);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return selectSclsList;
	}

	
	@Override
	public RestaurantVO selectRest(String bizno) {
		SqlSession session = null;
		RestaurantVO selectRest = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
			selectRest = session.selectOne("restaurant.selectRest",bizno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return selectRest;
	}

}
