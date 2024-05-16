package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.MyBatisUtil;


public class MemberDaoImpl implements IMemberDao {

	// �̱�������
	public static IMemberDao instance = null;

	private MemberDaoImpl() {
	}

	public static IMemberDao getInstance() {
		if (instance == null)
			instance = new MemberDaoImpl();
		return instance;
	}

	/**
	 * �α��� üũ�� ���� �޼���
	 * 
	 * @param memberVO
	 * @return �α��� ��������
	 */
	public boolean loginCheck(MemberVO memberVO, boolean isMemberLogin) {

		boolean isSuccess = false;
		SqlSession session = kr.or.ddit.util.MyBatisUtil.getSqlSession();
		MemberVO result = null;

		try {

			if (isMemberLogin) {
				result = session.selectOne("member.memberCheck", memberVO);
			} else if (isMemberLogin == false) {
				result = session.selectOne("member.loginCheck", memberVO);
			}

			if (result != null) {
				isSuccess = true;
			}

		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return isSuccess;
	}

	/**
	 * 이메일과 사번이 들어있는 객체로 비밀번호를 찾아서 비밀번호를 반환
	 * 
	 * @param memberVO
	 * @return usersPass
	 */
	@Override
	public String forgotPass(MemberVO memberVO) {

		SqlSession session = MyBatisUtil.getSqlSession();

		String usersPass = null;

		try {

			usersPass = session.selectOne("member.forgotPass", memberVO);

			if (usersPass != null) {
				session.commit();
			}

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return usersPass;
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

