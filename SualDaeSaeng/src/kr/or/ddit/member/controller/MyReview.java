package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.SessionUsersInfo;


@WebServlet("/myReview.do")
public class MyReview extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IMemberService service = MemberServiceImpl.getInstance();

		String usersId = (String) req.getSession().getAttribute("usersId");

		MemberVO mvo = service.selectScore(usersId);

		SessionUsersInfo info = SessionUsersInfo.getInstance();
		

		MemberVO memberVO = null;
		if (mvo != null) {
			memberVO = info.getMemberVO(mvo.getUsersId());
		}

		IMemberService empService = MemberServiceImpl.getInstance();
		MemberVO mv = empService.selectOne(usersId);

		req.setAttribute("mvo", mvo);
		req.setAttribute("memberVO", memberVO);
		req.setAttribute("mv", mv);

		RequestDispatcher disp = req.getRequestDispatcher("/member/myPageHome.do");
		disp.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
	}
}