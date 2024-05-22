package kr.or.ddit.restaurant.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.FileDetailVO;
import kr.or.ddit.member.vo.MemberVO;

@MultipartConfig
@WebServlet("/restaurant/reviewWrite.do")
public class restaurantReviewInsertController extends HttpServlet {

	private IBoardService service = BoardServiceImpl.getInstance();
	private static final String UPLOAD_DIR = "upload_files";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int levelChk = Integer.parseInt(req.getParameter("levelChk"));
		int idx = Integer.parseInt(req.getParameter("idx"));
		String restBizno = req.getParameter("no");
		String order = req.getParameter("order");
		
		if (order == null) {
	        order = "latest"; // 기본 값 설정
	    }
		
		req.setAttribute("levelChk", levelChk);
		req.setAttribute("idx", idx);
		req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		BoardVO boardVO = new BoardVO();
		HttpSession session = req.getSession();
		MemberVO memDetail = (MemberVO) session.getAttribute("memDetail");

		int levelChk = Integer.parseInt(req.getParameter("levelChk"));
		int level = Integer.parseInt(req.getParameter("level"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int idx = Integer.parseInt(req.getParameter("idx"));
		Part filePart = req.getPart("file");
		
		if(filePart != null && filePart.getSize() != 0) {
			 int fileStatus = service.insertBoardFile(filePart,levelChk);
			 List<FileDetailVO> fileList = service.getFileList(levelChk);
			 req.setAttribute("fileList", fileList);
		     boardVO.setFileNo(fileList.get(0).getFileNo());
		}
		
		boardVO.setBoardTitle(title);
		boardVO.setBoardCon(content);
		boardVO.setUsersNo(memDetail.getUsersNo());
		boardVO.setBoardLevel(level);

		int status = service.insertBoard(boardVO);
		if (status > 0) { // 성공
			resp.sendRedirect(req.getContextPath() + "/board/detail.do?boardNo=" + boardVO.getBoardNo() + "&idx=" + idx
					+ "&levelChk=" + levelChk);
		} else { // 실패
			req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
		}
	}
}