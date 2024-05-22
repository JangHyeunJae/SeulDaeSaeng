package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.contact.vo.ContactVO;


@WebServlet("/views/adminaccept.do")
public class AdminAccept extends HttpServlet {
	
	IAdminService service = AdminServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * String no = req.getParameter("qNO"); ContactVO contactVO =
		 * service.detailList(Integer.parseInt(no));
		 * 
		 * // 데이터를 전달하는 방법 req.setAttribute("contactVO", contactVO);
		 * 
		 * req.getRequestDispatcher("/views/contactDetail.jsp").forward(req, resp);	
		 */
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int usersNo = Integer.parseInt(req.getParameter("usersNo"));
		
		System.out.println("usersNo: " + usersNo);
		
		 int cnt = service.AdminAccept(usersNo);
		  
		 
		  
	}
}
