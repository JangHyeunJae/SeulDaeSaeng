package kr.or.ddit.restaurant.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.FileDetailVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;
import kr.or.ddit.restaurant.vo.ReviewVO;
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
			name = session.selectOne("restaurant.selectMclsName", cls);
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
			name = session.selectOne("restaurant.selectSclsName", cls);
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
	public List<RestaurantVO> selectSclsList() {
		SqlSession session = null;
		List<RestaurantVO> selectSclsList = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
			selectSclsList = session.selectList("restaurant.selectSclsList2");
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
	public RestaurantVO selectRest(String restBizno) {
		SqlSession session = null;
		RestaurantVO selectRest = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
			selectRest = session.selectOne("restaurant.selectRest",restBizno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return selectRest;
	}

	
	@Override
	public List<RestaurantVO> selectRestReview(String restBizno) {
		SqlSession session = null;
		List<RestaurantVO> selectRestReview = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
			selectRestReview = session.selectList("restaurant.selectRestReview",restBizno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return selectRestReview;
	}

	@Override
	public List<RestaurantVO> selectRestReviewAll(Map<String, Object> cls) {
		SqlSession session = null;
		List<RestaurantVO> selectRestReviewAll = null;
		try {
			session = MyBatisUtil.getSqlSession(true);
			selectRestReviewAll = session.selectList("restaurant.selectRestReviewAll",cls);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return selectRestReviewAll;
	}
	
	@Override
	public List<FileDetailVO> getFileList() {
		
		List<FileDetailVO> fileList = new ArrayList<FileDetailVO>();

		SqlSession session = null;

		try {
			session = MyBatisUtil.getSqlSession(true);
            
			fileList = session.selectList("restaurant.getFileList");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return fileList;
	}

	@Override
	public int insertFile(FileDetailVO fileDetail) {
		
		SqlSession session = null;
		int status = 0;		
		
		try {
			session = MyBatisUtil.getSqlSession();
			session.insert("restaurant.saveFile", fileDetail);
			status = session.insert("restaurant.saveFileDetail", fileDetail);
			
			if(status > 0) {	// 성공
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return status;
	}

	@Override
	public int insertReview(ReviewVO reviewVO) {
		SqlSession session = null;
		int status = 0;		
		
		try {
			session = MyBatisUtil.getSqlSession();
			status = session.insert("restaurant.insertReview", reviewVO);
			
			if(status > 0) {	// 성공
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		
		return status;
	}

	@Override
	public int deleteReview(int reviewNo) {

        SqlSession session = null;
		int cnt = 0;
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.update("restaurant.deleteReview", reviewNo);
			
			if(cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

}
