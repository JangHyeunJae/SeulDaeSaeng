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

@WebServlet("/eachClassBoard.do")
public class EachClassBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IBoardService boardService = BoardServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int classBoardChk = 2;
		int levelChk = Integer.parseInt(req.getParameter("levelChk"));

		String searchOption = req.getParameter("searchOption");
		if (searchOption != null && searchOption != "") {
			req.setAttribute("searchOption", searchOption);
		}

		List<BoardVO> boardList = boardService.selectBoardList(levelChk);
		req.setAttribute("boardList", boardList);
		req.setAttribute("classBoardChk", classBoardChk);
		req.setAttribute("levelChk", levelChk);
		
		//////////////////////URL체크////////////////////////////////
		String originalUrl = req.getRequestURL().toString();
	    String queryString = req.getQueryString();
	    if (queryString != null) {
	        originalUrl += "?" + queryString;
	    }
	    req.setAttribute("originalUrl", originalUrl);
		//////////////////////////////////////////////////////
		
	    
		req.getRequestDispatcher("/views/board/eachClassBoard.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int classBoardChk = 2;
		int levelChk = Integer.parseInt(req.getParameter("levelChk"));
		
		String searchOption = req.getParameter("searchOption");
		String searchText = req.getParameter("searchText");

		Map<String, Object> parameter = new HashMap<>();
		parameter.put("searchText", searchText);
		parameter.put("searchOption", searchOption);
		parameter.put("level", levelChk); //파라미터여서 name 안바꿈
		parameter.put("boardDiv", "class");
		
		List<BoardVO> boardList = boardService.searchClassBoardList(parameter);
		
		if (searchOption != null && searchOption != "") {
			req.setAttribute("searchOption", searchOption);
		}

		req.setAttribute("classBoardChk", classBoardChk);
		req.setAttribute("boardList", boardList);
		req.setAttribute("levelChk", levelChk);

		req.getRequestDispatcher("/views/board/eachClassBoard.jsp").forward(req, resp);
	}
}
