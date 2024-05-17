package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.AddressVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

@WebServlet("/member/myPageHome.do")
public class MyPageHome extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IMemberService service = MemberServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String usersId = (String)session.getAttribute("usersId");
		UsersVO usersVo = service.selectUsers(usersId);
		
		int usersNo = usersVo.getUsersNo();
		MemberVO memberVo = service.selectMember(usersNo);
		memberVo.setMemTel(memberVo.getMemTel().substring(0, 3) + "-"
						 + memberVo.getMemTel().substring(3, 7) + "-"
						 + memberVo.getMemTel().substring(7, 11));
		memberVo.setMemBirth(memberVo.getMemBirth().substring(0,10));
		
		int addrNo = memberVo.getAddrNo();
		AddressVO addrVo = service.selectAddr(addrNo);
		
		req.setAttribute("usersVo", usersVo);
		req.setAttribute("memberVo", memberVo);
		req.setAttribute("addrVo", addrVo);
		
		if(usersVo != null && memberVo != null && addrVo != null) {
			req.getRequestDispatcher("/views/member/myPage.jsp").forward(req, resp);
		}else resp.sendRedirect("/views/index.jsp");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
