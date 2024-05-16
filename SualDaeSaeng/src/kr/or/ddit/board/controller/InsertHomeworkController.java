package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/Homework/write.do")
public class InsertHomeworkController extends HttpServlet{

	private IBoardService service = BoardServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int levelChk = Integer.parseInt(req.getParameter("classNo"));
		req.setAttribute("levelChk", levelChk);
		req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int level = Integer.parseInt(req.getParameter("levelChk"));

		BoardVO boardVO = new BoardVO();
		boardVO.setBoardTitle(title);
		boardVO.setBoardCon(content);
		boardVO.setUsersNo(1); // 세션에서 꺼내와야함
		boardVO.setBoardLevel(level);
		
		int status = service.insertBoard(boardVO);
		if(status > 0) { 	// 성공
			resp.sendRedirect("/board/detail.do?boardNo=" + boardVO.getBoardNo());
		}else {				// 실패
			req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
		}
	}
}
