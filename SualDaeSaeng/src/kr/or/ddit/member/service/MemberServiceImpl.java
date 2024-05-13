package kr.or.ddit.member.service;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

import java.util.List;



public class MemberServiceImpl implements IMemberService{
	
	// 싱글톤패턴
	public static IMemberService instance = null;
	private MemberServiceImpl() {}
	public static IMemberService getInstance() {
		if(instance == null) instance = new MemberServiceImpl();
		return instance;
	}
	IMemberDao memberDao = MemberDaoImpl.getInstance();
	
	/**
	 * 로그인 체크를 위한 메서드, 파라미터로 empVO와 관리자로그인 체크 여부가 들어간다
	 * @param empvo, isAdminLogin
	 * @return 로그인 성공여부
	 */
	@Override
	public boolean loginCheck(MemberVO memberVO, boolean isAdminLogin) {
		return memberDao.loginCheck(memberVO, isAdminLogin);
	}
		

   /**
	 * 사원정보 등록을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @return 사원 등록이 성공하면 1이상의 값이 반환되고, 실패하면 0이 반환됨.
	 */
	@Override
	public int registMember(MemberVO memberVO) {
		return memberDao.joinEmployee(memberVO);
	}
	
	
	/**
	 * 사원정보 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
	 */
	@Override
	public int modifyMember(MemberVO memberVO, boolean isAdmin) {
		int cnt = memberDao.updateEmployee(memberVO, isAdmin);
		return cnt;
	}
	
	/**
	 * 사원정보-상태 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @param 관리자권한 업데이트 유무
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
	 */
	@Override
	public int updateMemberState(MemberVO memberVO) {
		int cnt = memberDao.updateEmployeeState(memberVO);
		return cnt;
	}
	
	/**
	 * 사원정보 삭제를 위한 메서드
	 * @param empNo 삭제할 사원의 사번
	 * @return 삭제에 성공하면 1 반환, 실패하면 0 반환
	 */
	@Override
	public int removeMember(String userId) {
		return memberDao.deleteMember(userId);
	}
	
	
	/**
	 * 사원정보가 존재하는지 확인하는 메서드
	 * @param empNo 체크할 사원의 사번
	 * @return 사번이 존재하면 true, 없으면 false 리턴
	 */
	@Override
	public boolean checkMember(String userId) {
		return memberDao.checkEmployee(userId);
	}
	
	
	/**
	 * 해당 사번에 해당하는 사원정보를 가져오기 위한메서드
	 * @param empNo 가져올 사번
	 * @return 해당 사원의 정보를 담은 empVO 객체
	 */
	@Override
	public MemberVO selectOne(String userId) {
		return memberDao.selectOne(userId);
	}
	
	
	/**
	 * 전체 사원정보(리스트)를 가져오는 메서드
	 */
	@Override
	public List<MemberVO> selectAll() {
		List<MemberVO> memberList = memberDao.selectAll();
		return memberList;
	}
	
		
	/**
	 * 이메일과 사번이 들어있는 객체로 비밀번호를 찾아서 비밀번호를 반환
	 * @param empVO
	 * @return empPw
	 */
	@Override
	public String forgotPw(MemberVO memberVO) {
		return memberDao.forgotPw(memberVO);
	}
	
	/**
	 * 	사번으로 메일 출력을 위한 메서드
	 */
	@Override
	public String mailSelect(String userId) {
		return memberDao.mailSelect(userId);
	}
	
	
}