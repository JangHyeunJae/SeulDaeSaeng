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

@WebServlet("/eachClassNotice.do")
public class EachClassNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IBoardService boardService = BoardServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int levelChk = 1;
		int level = Integer.parseInt(req.getParameter("classNo"));

		String msg = null;
		if (req.getParameter("msg") != null) {
			msg = req.getParameter("msg");
		}

		String searchOption = req.getParameter("searchOption");
		if (searchOption != null && searchOption != "") {
			req.setAttribute("searchOption", searchOption);
		}

		List<BoardVO> boardList = boardService.getClassNoticeList(level);
		req.setAttribute("boardList", boardList);
		req.setAttribute("classNo", level);
		req.setAttribute("levelChk", levelChk);
		req.getRequestDispatcher("/views/board/eachClassBoard.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int levelChk = 1;
		int level = Integer.parseInt(req.getParameter("classNo"));
		
		String searchOption = req.getParameter("searchOption");
		String searchText = req.getParameter("searchText");

		Map<String, Object> parameter = new HashMap<>();
		parameter.put("searchText", searchText);
		parameter.put("searchOption", searchOption);
		parameter.put("level", level);
		parameter.put("boardDiv", "notice");
		
		List<BoardVO> boardList = boardService.searchClassBoardList(parameter);
		
		if (searchOption != null && searchOption != "") {
			req.setAttribute("searchOption", searchOption);
		}

		req.setAttribute("levelChk", levelChk);
		req.setAttribute("boardList", boardList);
		req.setAttribute("classNo", level);

		req.getRequestDispatcher("/views/board/eachClassBoard.jsp").forward(req, resp);
	}
}
