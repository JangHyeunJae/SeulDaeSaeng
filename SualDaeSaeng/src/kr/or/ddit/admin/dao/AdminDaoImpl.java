package kr.or.ddit.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.admin.vo.MemberReqVO;
import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.util.MyBatisUtil;

public class AdminDaoImpl implements IAdmindao {

	private static AdminDaoImpl instance = null;
	private AdminDaoImpl() {}
	public static AdminDaoImpl getInstance() {
		if(instance == null) {
			instance = new AdminDaoImpl();
		}
		return instance;
	}
	
	
	@Override
	public List<MemberReqVO> selectmemList() {
		SqlSession session = null;
		List<MemberReqVO> memList = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			memList = session.selectList("admin.selectmemList");   // xml 
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return memList;
	}
	
	
	
	
	@Override
	public int AdminAccept(int usersNo) {
		SqlSession session = null;
		int cnt=-1;
		
		try {
			session = MyBatisUtil.getSqlSession();	
			 cnt = session.update("admin.adminAccept", usersNo);   // xml 
			 
			 if(cnt>0) session.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return cnt;
	}
	
	
	
	@Override
	public List<MemberReqVO> selectallList() {
		
		SqlSession session = null;
		List<MemberReqVO> memList = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);	
			memList = session.selectList("admin.selectallList");   // xml 
			for(MemberReqVO vo : memList) {
				System.out.println(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return memList;
	}
	
	
	@Override
	public MemberReqVO selectmember(String parameter) {
		SqlSession session = null;
		MemberReqVO memberReqVo = null;
		
		int num = Integer.parseInt(parameter);
		try {
			session = MyBatisUtil.getSqlSession(true);
			memberReqVo = session.selectOne("admin.selectmember", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return memberReqVo;

	}
	


}
