package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.AddressVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;
import kr.or.ddit.util.MemberUtil;

@WebServlet("/member/myPageHome.do")
public class MyPageHome extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IMemberService service = MemberServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberUtil.memberSelectOne(req);
		
		UsersVO usersVo = (UsersVO)req.getAttribute("usersVo");
		AddressVO addrVo = (AddressVO)req.getAttribute("addrVo");
		MemberVO memberVo = (MemberVO)req.getAttribute("memberVo");
		
		List<BoardVO> memBoardList = service.memberBoardList(usersVo.getUsersNo());
		MemberUtil.boardLevelKr(memBoardList);
		req.setAttribute("memBoardList", memBoardList);
		
		if(usersVo != null && memberVo != null && addrVo != null ) {
			req.getRequestDispatcher("/views/member/myPage.jsp").forward(req, resp);
		}else resp.sendRedirect("/views/index.jsp");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
