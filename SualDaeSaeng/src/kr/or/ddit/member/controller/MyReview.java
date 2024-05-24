package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.vo.UsersVO;
import kr.or.ddit.restaurant.service.IRestaurantService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.RestaurantVO;
import kr.or.ddit.util.MemberUtil;

@WebServlet("/member/myReview.do")
public class MyReview extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	IRestaurantService service = RestaurantServiceImpl.getInstance();

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usersId = (String) req.getSession().getAttribute("usersId");

        if (usersId != null) {
            List<RestaurantVO> myReview = service.getReviewsByUserId(usersId);
            req.setAttribute("myReview", myReview);
            System.out.println(myReview.toString());
//            req.getRequestDispatcher("/views/member/myReview.jsp").forward(req, resp);
        } else {
            MemberUtil.memberMessage(req, resp, "잘못된 접근입니다.", "/main.do");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
