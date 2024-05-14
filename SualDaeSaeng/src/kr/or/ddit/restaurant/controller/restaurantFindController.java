package kr.or.ddit.restaurant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;

import kr.or.ddit.restaurant.service.IRestaurantService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantVO;


@WebServlet("/restaurant/find.do")
public class restaurantFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IRestaurantService service = RestaurantServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mcls = request.getParameter("mcls");
		String scls = request.getParameter("scls");
		
		//scls가 없는 경우
		if(scls == null) { scls =""; }
		List<RestaurantVO> restList = service.selectRestaurantType(mcls,scls);
		request.setAttribute("restList", restList);
		request.getRequestDispatcher("/views/restaurant/restaurantFind.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
