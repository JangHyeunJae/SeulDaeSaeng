package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

@WebServlet("/classTeacherBoard.do")
public class TeacherClassBoardController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 IBoardService boardService = BoardServiceImpl.getInstance();
		 
		 int usersNo = 3; 
		 int classNo = Integer.parseInt(req.getParameter("classNo"));
         List<BoardVO> noticeBoardList = boardService.getClassNoticeList(classNo);
         List<BoardVO> classBoardList = boardService.selectBoardList(classNo);
		 MemberVO tDetail = boardService.getMemberDetail(usersNo);
		 req.setAttribute("usersNo", tDetail.getUsersNo());
		 req.setAttribute("classNo", classNo);
		 req.setAttribute("tDetail", tDetail);
		 req.setAttribute("noticeBoardList", noticeBoardList);
		 req.setAttribute("classBoardList", classBoardList);
		 
		 req.getRequestDispatcher("/views/board/classTeacherBoard.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	}
}