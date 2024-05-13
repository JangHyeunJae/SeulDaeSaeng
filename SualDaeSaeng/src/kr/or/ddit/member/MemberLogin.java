package kr.or.ddit.member;

import java.io.IOException;

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




@WebServlet("/login.do")
public class MemberLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// req.getRequestDispatcher("/insert.do").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String userId = req.getParameter("user_Id");
		String userPw = req.getParameter("user_Pw");
		Boolean isAdminLogin = Boolean.parseBoolean(req.getParameter("adminLogin"));

		IMemberService loginService = MemberServiceImpl.getInstance();
		MemberVO memberVO = new MemberVO();
		memberVO.setUserId(userId);
		memberVO.setUserPw(userPw);

		boolean isSuccess = loginService.loginCheck(memberVO, isAdminLogin);

		if (isSuccess) {
			System.out.println("로그인성공");
			req.getSession().setAttribute("userId", userId); // 세션에 사번 넣기
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "ok");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		} else {
			
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("isSuccess", "fail");
			String jsonStr = new Gson().toJson(jsonObject);
			resp.setContentType("application/json");
			resp.getWriter().write(jsonStr);
		}
	}
}