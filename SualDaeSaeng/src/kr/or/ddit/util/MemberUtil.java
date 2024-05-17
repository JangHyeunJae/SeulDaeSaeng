package kr.or.ddit.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.AddressVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

public class MemberUtil {
	
	static IMemberService service = MemberServiceImpl.getInstance();

	public static void memberSelectOne(HttpServletRequest req) {
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
	}
	
	
	
}
