package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;




public interface IMemberDao {
	
	/**
	 * 로그인 체크를 위한 메서드, 파라미터로 empVO와 관리자로그인 체크 여부가 들어간다
	 * @param empvo, isAdminLogin
	 * @return 로그인 성공여부
	 */
	public boolean loginCheck(MemberVO memberVO, boolean isAdminLogin);
	
	
	/**
	 * 회원가입 시켜주는 메서드
	 * @param empVO
	 * @return 성공여부
	 */
	public int joinEmployee(MemberVO memberVO);
	
	
	/**
	 * 사원정보 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
	 */
	public int updateEmployee(MemberVO memberVO, boolean isAdmin);
	
	/**
	 * 사원정보-상태 수정을 위한 메서드
	 * @param empVO에 등록할 데이터가 담겨진 EmpVO의 객체
	 * @param 관리자권한 업데이트 유무
	 * @return 사원정보 수정에 성공하면 1이상의 값 반환, 실패하면 0 반환
	 */
	int updateEmployeeState(MemberVO memberVO);
	
	/**
	 * 사원정보 삭제를 위한 메서드
	 * @param empNo 삭제할 사원의 사번
	 * @return 삭제에 성공하면 1 반환, 실패하면 0 반환
	 */
	public int deleteMember(String userId);
	
	
	/**
	 * 사원정보가 존재하는지 확인하는 메서드
	 * @param empNo 체크할 사원의 사번
	 * @return 사번이 존재하면 true, 없으면 false 리턴
	 */
	public boolean checkEmployee(String userId);
	
	
	/**
	 * 해당 사번에 해당하는 사원정보를 가져오기 위한메서드
	 * @param empNo 가져올 사번
	 * @return 해당 사원의 정보를 담은 empVO 객체
	 */
	public MemberVO selectOne(String memberVO);

	
	/**
	 * 전체 사원정보(리스트)를 가져오는 메서드
	 */
	public List<MemberVO> selectAll();
	
	
	/**
	 * 	사번으로 메일 출력을 위한 메서드
	 */
	public String mailSelect (String userId);

  
  /**
	 * 이메일과 사번이 들어있는 객체로 비밀번호를 찾아서 비밀번호를 반환
	 * @param empVO
	 * @return empPw
	 */
	public String forgotPw(MemberVO memberVO);
}