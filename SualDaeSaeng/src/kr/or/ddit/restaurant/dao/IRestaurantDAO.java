package kr.or.ddit.restaurant.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.FileDetailVO;
import kr.or.ddit.restaurant.vo.RestaurantVO;
import kr.or.ddit.restaurant.vo.ReviewVO;

public interface IRestaurantDAO {
	public List<RestaurantVO> selectRestaurantType(Map<String, Object> cls);
	public int selectRestaurantTypeTotal(Map<String, Object> cls);
	public String selectMclsName(Map<String, Object> cls);
	public String selectSclsName(Map<String, Object> cls);
	public List<RestaurantVO> selectMclsList();
	public List<RestaurantVO> selectSclsList();
	public List<RestaurantVO> selectSclsList(String mcls);
	public RestaurantVO selectRest(String bizno);
	public List<RestaurantVO> selectRestReview(String restBizno);
	public List<RestaurantVO> selectRestReviewAll(Map<String, Object> cls);
	public List<FileDetailVO> getFileList();
	public int insertFile(FileDetailVO fileDetail);
	public int insertReview(ReviewVO reviewVO);
	public int deleteReview(int reviewNo);
}
