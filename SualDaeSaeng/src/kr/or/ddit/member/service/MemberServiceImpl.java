package kr.or.ddit.member.service;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;

public class MemberServiceImpl implements IMemberService{
	
	private static MemberServiceImpl instance = null;
	private MemberServiceImpl() {}
	public static MemberServiceImpl getInstance() {
		if(instance == null) {
			instance = new MemberServiceImpl();
		}
		return instance;
	}
	
	IMemberDao dao = MemberDaoImpl.getInstance();
	
	@Override
	public int memberIdChk(String usersId) {
		return dao.memberIdChk(usersId);
	}

}
