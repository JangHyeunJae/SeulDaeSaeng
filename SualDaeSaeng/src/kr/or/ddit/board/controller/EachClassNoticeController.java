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

@WebServlet("/eachClassNotice.do")
public class EachClassNoticeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		/* int level = 0; */
		 IBoardService boardService = BoardServiceImpl.getInstance();
		 
		 int level = Integer.parseInt(req.getParameter("classNo"));
         List<BoardVO> boardList = boardService.getClassNoticeList(level);
         req.setAttribute("boardList", boardList);
         req.setAttribute("classNo", level);
		 req.getRequestDispatcher("/views/board/eachClassBoard.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	}
}