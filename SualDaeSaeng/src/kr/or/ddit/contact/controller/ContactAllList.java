package kr.or.ddit.contact.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.contact.service.ContactServiceImpl;
import kr.or.ddit.contact.service.IContactService;
import kr.or.ddit.contact.vo.ContactVO;

@WebServlet("/views/contactList.do")
public class ContactAllList extends HttpServlet {
	
	IContactService service = ContactServiceImpl.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 // 회원가입된 회원 전체조회 
	      List<ContactVO> contactList = service.selectallList();

	      req.setAttribute("contactList", contactList);
	      
	      req.getRequestDispatcher("/views/admin/contactList.jsp").forward(req, resp);
	   }
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
