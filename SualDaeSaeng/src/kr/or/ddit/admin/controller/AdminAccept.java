package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;


@WebServlet("/views/adminaccept.do")
public class AdminAccept extends HttpServlet {
	
	IAdminService service = AdminServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int usersNo = Integer.parseInt(req.getParameter("usersNo"));
		
		System.out.println("usersNo: " + usersNo);
		
		 int cnt = service.AdminAccept(usersNo);
		  
		  
		  
	}
}
