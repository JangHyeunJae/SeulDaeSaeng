package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/member/login.jsp").forward(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String usersId = req.getParameter("id");
		String usersPass = req.getParameter("pw");
		Boolean isMemberLogin = Boolean.parseBoolean(req.getParameter("memberLogin"));

		IMemberService loginService = MemberServiceImpl.getInstance();
		MemberVO memberVO = new MemberVO();
		memberVO.setUsersId(usersId);
		memberVO.setUsersPass(usersPass);

		boolean isSuccess = loginService.loginCheck(memberVO, isMemberLogin);

		if (isSuccess) {
			System.out.println("로그인성공");
			MemberVO memDetail = loginService.getMemDetail(usersId);
			UsersVO usersDetail = loginService.getUsersDetail(usersId);
			req.getSession().setAttribute("usersId", usersId);
			req.getSession().setAttribute("memDetail", memDetail);
      req.getSession().setAttribute("usersPass", usersPass); 
			req.getSession().setAttribute("usersRole", usersDetail.getUsersRole());
			resp.sendRedirect(req.getContextPath() + "/main.do");

		} else {
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			resp.sendRedirect("/views/member/login.jsp");
		}
	}
}