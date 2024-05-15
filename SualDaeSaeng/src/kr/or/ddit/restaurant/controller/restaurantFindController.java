package kr.or.ddit.restaurant.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.restaurant.service.IRestaurantService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantVO;


@WebServlet("/restaurant/find.do")
public class restaurantFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IRestaurantService service = RestaurantServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String, Object> cls = new HashMap<String, Object>();
		String mcls = request.getParameter("mcls");
		String scls = request.getParameter("scls");
		
		//scls가 없는 경우
		if(scls == null) scls ="";
		
		cls.put("mcls", mcls);
		cls.put("scls", scls);
		
		List<RestaurantVO> restList = service.selectRestaurantType(cls);
		request.setAttribute("restList", restList);
		request.getRequestDispatcher("/views/restaurant/restaurantFind.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
