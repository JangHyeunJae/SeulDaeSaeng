package kr.or.ddit.contact.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.contact.vo.ContactVO;
import kr.or.ddit.util.MyBatisUtil;

public class ContactDaoImpl implements IContactDao {
	
	
	private static ContactDaoImpl instance = null;
	private ContactDaoImpl() {}
	public static ContactDaoImpl getInstance() {
		if(instance == null) {
			instance = new ContactDaoImpl();
		}
		return instance;
	}
	
	
	@Override
	public int insertContact(ContactVO contactVO) {
		
		SqlSession session = null;		// 디비와 연결하기 위한 생산품
		int status = 0;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			System.out.println("vo왔니?" + contactVO.toString());
			status = session.insert("contact.insertContact", contactVO);
			
			if(status > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) {
				session.close();
			}
		}
		return status;
	}

}
