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
import kr.or.ddit.member.vo.UsersVO;
import kr.or.ddit.restaurant.service.IRestaurantService;
import kr.or.ddit.restaurant.service.RestaurantServiceImpl;
import kr.or.ddit.restaurant.vo.ReviewVO;

@MultipartConfig
@WebServlet("/restaurant/reviewWrite.do")
public class restaurantReviewInsertController extends HttpServlet {

	private IRestaurantService service = RestaurantServiceImpl.getInstance();
	private static final String UPLOAD_DIR = "upload_files";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String restBizno = req.getParameter("no");
		String order = req.getParameter("order");
		
		if (order == null) {
	        order = "latest"; // 기본 값 설정
		}

		req.setAttribute("restBizno", restBizno);
		req.setAttribute("order", order);
	        
		req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		ReviewVO ReviewVO = new ReviewVO();
		HttpSession session = req.getSession();
		MemberVO memDetail = (MemberVO) session.getAttribute("memDetail");
		UsersVO userDetail = (UsersVO) session.getAttribute("userDetail");

		String restBizno = req.getParameter("restBizno");
		int reviewStar = Integer.parseInt(req.getParameter("reviewStar"));
		String review = req.getParameter("review");
		Part filePart = req.getPart("file");
		
		if(filePart != null && filePart.getSize() != 0) {
			service.insertFile(filePart);
			List<FileDetailVO> fileList = service.getFileList();
			req.setAttribute("fileList", fileList);
			ReviewVO.setFileNo(fileList.get(0).getFileNo());
		}
		
		ReviewVO.setUsersNo(memDetail.getUsersNo());
		ReviewVO.setRestBizno(restBizno);
		ReviewVO.setReviewStar(reviewStar);
		ReviewVO.setReviewText(review);
		
		int status = service.insertReview(ReviewVO);
		if (status > 0) { // 성공
			resp.sendRedirect(req.getContextPath()+"/restaurant/view.do?no="+restBizno);
		} else { // 실패
			req.getRequestDispatcher("/restaurant/reviewWrite.do?no="+restBizno).forward(req, resp);
		}
	}
}