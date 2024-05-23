package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.UsersVO;

@WebServlet("/myReview.do")
public class MyReview extends HttpServlet {
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IMemberService service = MemberServiceImpl.getInstance();
        String usersId = (String) req.getSession().getAttribute("usersId");

        if (usersId != null) {
            List<UsersVO> myReview = service.getReviewsByUserId(usersId);
            req.setAttribute("myReview", myReview);
            req.getRequestDispatcher("/views/member/myReview.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/main.do");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
