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
	 * @param empvo
	 * @return �α��� ��������
	 */
	public boolean loginCheck(MemberVO memberVO, boolean isAdminLogin) {

		boolean isSuccess = false;
		SqlSession session = kr.or.ddit.util.MyBatisUtil.getSqlSession();
		MemberVO result = null;

		try {

			if (isAdminLogin) {
				result = session.selectOne("member.adminCheck", memberVO);
			} else if (isAdminLogin == false) {
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
	 * ȸ������ �����ִ� �޼���
	 * 
	 * @param empVO
	 * @return ��������
	 */
	public int joinMember(MemberVO memberVO) {

		SqlSession session = MyBatisUtil.getSqlSession();

		int cnt = 0;

		try {
			cnt = session.insert("member.joinMember", memberVO);
			if (cnt > 0) {
				session.commit();
			}

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	/**
	 * ������� ������ ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @param �����ڱ��� ������Ʈ ����
	 * @return ������� ������ �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */
	public int updateMember(MemberVO memberVO, boolean isAdmin) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getSqlSession();
		
		try {
			
			if(isAdmin) {
			cnt = session.update("member.updateMemberAdmin", memberVO);
			} else {
				cnt = session.update("member.updateMember", memberVO);
			}
			if(cnt > 0) {
				session.commit();
			}
			
		} catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}
	
	/**
	 * �������-���� ������ ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @param �����ڱ��� ������Ʈ ����
	 * @return ������� ������ �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */
	public int updateMemberState(MemberVO memberVO) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getSqlSession();
		
		try {
			cnt = session.update("member.updateState", memberVO);
			if(cnt > 0) session.commit();
	
		} catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		
		return cnt;
	}

	/**
	 * ������� ������ ���� �޼���
	 * 
	 * @param empNo ������ ����� ���
	 * @return ������ �����ϸ� 1 ��ȯ, �����ϸ� 0 ��ȯ
	 */
	public int deleteMember(String userId) {
		int cnt = 0;

		SqlSession session = MyBatisUtil.getSqlSession();

		try {
			cnt = session.delete("member.deleteMember", userId);

			if (cnt > 0) {
				session.commit();
			}

		} catch (PersistenceException ex) {
			ex.printStackTrace();
			session.rollback();

		} finally {
			session.close();
		}
		return cnt;
	}

	/**
	 * ��������� �����ϴ��� Ȯ���ϴ� �޼���
	 * 
	 * @param empNo üũ�� ����� ���
	 * @return ����� �����ϸ� true, ������ false ����
	 */
	public boolean checkMember(String userId) {

		boolean isExist = false;

		SqlSession session = MyBatisUtil.getSqlSession(true);

		try {
			int cnt = session.selectOne("member.checkEmployee", userId);

			if (cnt > 0) {
				isExist = true;
			}

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return isExist;
	}

	/**
	 * �ش� ����� �ش��ϴ� ��������� �������� ���� �޼���
	 * 
	 * @param empNo ������ ���
	 * @return �ش� ����� ������ ���� empVO ��ü
	 */
	public MemberVO selectOne(String userId) {

		SqlSession session = MyBatisUtil.getSqlSession();

		MemberVO ev = null;
		try {
			ev = session.selectOne("employee.selectOne", userId);
			if (ev != null) {
				session.commit();
			}
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return ev;
	}

	/**
	 * ��ü �������(����Ʈ)�� �������� �޼���
	 */
	public List<MemberVO> selectAll() {
		List<MemberVO> memberList = new ArrayList<MemberVO>();

		SqlSession session = MyBatisUtil.getSqlSession(true);

		try {
			memberList = session.selectList("member.selectAll");
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return memberList;
	}

	/**
	 * �̸��ϰ� ����� ����ִ� ��ü�� ��й�ȣ�� ã�Ƽ� ��й�ȣ�� ��ȯ
	 * 
	 * @param memberVO
	 * @return userPw
	 */
	public String forgotPw(MemberVO memberVO) {

		SqlSession session = MyBatisUtil.getSqlSession();

		String userPw = null;

		try {

			userPw = session.selectOne("member.forgotPw", memberVO);

			if (userPw != null) {
				session.commit();
			}

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return userPw;
	}
	
	public String mailSelect(String userId) {
		
		SqlSession session = MyBatisUtil.getSqlSession();

		String ev = "";
		try {
			ev = session.selectOne("member.mailSelect", userId);
			if(ev!=null) {
				 session.commit();
			 }
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return ev;
	}

	@Override
	public int joinEmployee(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEmployee(MemberVO memberVO, boolean isAdmin) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEmployeeState(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean checkEmployee(String userId) {
		// TODO Auto-generated method stub
		return false;
	}
}