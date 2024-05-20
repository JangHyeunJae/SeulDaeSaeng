package kr.or.ddit.restaurant.service;

import java.util.List;
import java.util.Map;

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
	public List<RestaurantVO> selectRestaurantType(Map<String, Object> cls) {
		return dao.selectRestaurantType(cls);
	}

	@Override
	public int selectRestaurantTypeTotal(Map<String, Object> cls) {
		return dao.selectRestaurantTypeTotal(cls);
	}

	@Override
	public String selectMclsName(Map<String, Object> cls) {
		return dao.selectMclsName(cls);
	}

	@Override
	public String selectSclsName(Map<String, Object> cls) {
		return dao.selectSclsName(cls);
	}

	@Override
	public List<RestaurantVO> selectMclsList() {
		return dao.selectMclsList();
	}

	@Override
	public List<RestaurantVO> selectSclsList(String mcls) {
		return dao.selectSclsList(mcls);
	}

	@Override
	public List<RestaurantVO> selectSclsList() {
		return dao.selectSclsList();
	}

	@Override
	public RestaurantVO selectRest(String restBizno) {
		return dao.selectRest(restBizno);
	}

	
}
