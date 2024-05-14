package kr.or.ddit.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.admin.vo.memberReqVO;
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
	public List<memberReqVO> selectmemList() {
		SqlSession session = null;
		List<memberReqVO> memList = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);	
			memList = session.selectList("admin.selectmemList");   // xml 
			for(memberReqVO vo : memList) {
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
	
	
	
	
	


}
