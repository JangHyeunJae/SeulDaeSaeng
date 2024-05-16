package kr.or.ddit.restaurant.service;

import java.util.List;

import org.apache.logging.log4j.CloseableThreadContext.Instance;
import org.apache.logging.log4j.core.net.DatagramOutputStream;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.restaurant.dao.IRestaurantDAO;
import kr.or.ddit.restaurant.dao.RestaurantDAOImpl;
import kr.or.ddit.restaurant.vo.RestaurantVO;

public class RestaurantServiceImpl implements IRestaurantService {
	
	private static RestaurantServiceImpl instance = null;
	
	private RestaurantServiceImpl() {}
	
	public static RestaurantServiceImpl getInstance() {
		if(instance == null) {
			instance = new RestaurantServiceImpl();
		}
		return instance;
	}
	
	private IRestaurantDAO dao = RestaurantDAOImpl.getInstance();

	@Override
	public List<RestaurantVO> selectRestaurantType(String mcls) {
		return dao.selectRestaurantType(mcls);
	}

	@Override
	public List<RestaurantVO> selectRestaurantType(String mcls, String scls) {
		return dao.selectRestaurantType(mcls,scls);
	}

	
}
