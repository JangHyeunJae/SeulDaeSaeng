package kr.or.ddit.member.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MyBatisUtil;

public class MemberDaoImpl implements IMemberDao{
	
	private static MemberDaoImpl instance = null;
	private MemberDaoImpl() {}
	public static MemberDaoImpl getInstance() {
		if(instance == null) {
			instance = new MemberDaoImpl();
		}
		return instance;
	}
	
	@Override
	public int memberIdChk(String usersId) {
		
		SqlSession session = null;
		int cnt = 99;
		try {
			session = MyBatisUtil.getSqlSession(true);
			cnt = session.selectOne("member.memberIdChk", usersId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session != null) {
				session.close();
			}
		}
		
		return cnt;
	}

}
