package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

@WebServlet("/allBoard.do")
public class AllBoardListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	IBoardService boardService = BoardServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int level = 0;
		
		String msg = null;
		if(req.getParameter("msg") != null) {
			msg = req.getParameter("msg");
		}
		
		String searchOption = req.getParameter("searchOption");
		if (searchOption != null && searchOption != "") {
			req.setAttribute("searchOption", searchOption);
		}
		
		List<BoardVO> boardList = boardService.allBoardList();

		// levelChk는 detail 진입 전에 어느 목록에 있었는지 저장(전체, 자유 등)
		req.setAttribute("levelChk", level);
		req.setAttribute("boardList", boardList);
		req.setAttribute("msg", msg);

		req.getRequestDispatcher("/views/board/allBoard.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int level = 0;

		String searchOption = req.getParameter("searchOption");
		String searchText = req.getParameter("searchText");

		Map<String, Object> parameter = new HashMap<>();
		parameter.put("searchText", searchText);
		parameter.put("searchOption", searchOption);
		
		List<BoardVO> boardList = boardService.searchAllBoardList(parameter);
		
		if (searchOption != null && searchOption != "") {
			req.setAttribute("searchOption", searchOption);
		}

		req.setAttribute("levelChk", level);
		req.setAttribute("boardList", boardList);

		req.getRequestDispatcher("/views/board/allBoard.jsp").forward(req, resp);
	}
}