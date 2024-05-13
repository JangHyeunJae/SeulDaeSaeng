package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;




public interface IMemberDao {
	
	/**
	 * �α��� üũ�� ���� �޼���, �Ķ���ͷ� empVO�� �����ڷα��� üũ ���ΰ� ����
	 * @param empvo, isAdminLogin
	 * @return �α��� ��������
	 */
	public boolean loginCheck(MemberVO memberVO, boolean isAdminLogin);
	
	
	/**
	 * ȸ������ �����ִ� �޼���
	 * @param empVO
	 * @return ��������
	 */
	public int joinEmployee(MemberVO memberVO);
	
	
	/**
	 * ������� ������ ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @return ������� ������ �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */
	public int updateEmployee(MemberVO memberVO, boolean isAdmin);
	
	/**
	 * �������-���� ������ ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @param �����ڱ��� ������Ʈ ����
	 * @return ������� ������ �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */
	int updateEmployeeState(MemberVO memberVO);
	
	/**
	 * ������� ������ ���� �޼���
	 * @param empNo ������ ����� ���
	 * @return ������ �����ϸ� 1 ��ȯ, �����ϸ� 0 ��ȯ
	 */
	public int deleteMember(String userId);
	
	
	/**
	 * ��������� �����ϴ��� Ȯ���ϴ� �޼���
	 * @param empNo üũ�� ����� ���
	 * @return ����� �����ϸ� true, ������ false ����
	 */
	public boolean checkEmployee(String userId);
	
	
	/**
	 * �ش� ����� �ش��ϴ� ��������� �������� ���Ѹ޼���
	 * @param empNo ������ ���
	 * @return �ش� ����� ������ ���� empVO ��ü
	 */
	public MemberVO selectOne(String memberVO);

	
	/**
	 * ��ü �������(����Ʈ)�� �������� �޼���
	 */
	public List<MemberVO> selectAll();
	
	
	/**
	 * 	������� ���� ����� ���� �޼���
	 */
	public String mailSelect (String userId);

  
  /**
	 * �̸��ϰ� ����� ����ִ� ��ü�� ��й�ȣ�� ã�Ƽ� ��й�ȣ�� ��ȯ
	 * @param empVO
	 * @return empPw
	 */
	public String forgotPw(MemberVO memberVO);
}