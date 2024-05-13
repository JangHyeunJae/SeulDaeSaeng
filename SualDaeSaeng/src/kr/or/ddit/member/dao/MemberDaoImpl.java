package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.MyBatisUtil;


public class MemberDaoImpl implements IMemberDao {

	// 싱글톤패턴
	public static IMemberDao instance = null;

	private MemberDaoImpl() {
	}

	public static IMemberDao getInstance() {
		if (instance == null)
			instance = new MemberDaoImpl();
		return instance;
	}

	/**
	 * 로그인 체크를 위한 메서드
	 * 
	 * @param empvo
	 * @return 로그인 성공여부
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
	 * 회원가입 시켜주는 메서드
	 * 
	 * @param empVO
	 * @return 성공여부
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
	 * 사원정보 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @param 관리자권한 업데이트 유무
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
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
	 * 사원정보-상태 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @param 관리자권한 업데이트 유무
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
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
	 * 사원정보 삭제를 위한 메서드
	 * 
	 * @param empNo 삭제할 사원의 사번
	 * @return 삭제에 성공하면 1 반환, 실패하면 0 반환
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
	 * 사원정보가 존재하는지 확인하는 메서드
	 * 
	 * @param empNo 체크할 사원의 사번
	 * @return 사번이 존재하면 true, 없으면 false 리턴
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
	 * 해당 사번에 해당하는 사원정보를 가져오기 위한 메서드
	 * 
	 * @param empNo 가져올 사번
	 * @return 해당 사원의 정보를 담은 empVO 객체
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
	 * 전체 사원정보(리스트)를 가져오는 메서드
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
	 * 이메일과 사번이 들어있는 객체로 비밀번호를 찾아서 비밀번호를 반환
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