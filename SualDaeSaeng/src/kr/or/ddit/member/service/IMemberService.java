package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;


public interface IMemberService {

	/**
	 * �α��� üũ�� ���� �޼���, �Ķ���ͷ� empVO�� �����ڷα��� üũ ���ΰ� ����
	 * @param empvo, isAdminLogin
	 * @return �α��� ��������
	 */
	public boolean loginCheck(MemberVO memberVO, boolean isAdminLogin);
	
	
	/**
	 * ������� ����� ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @return ��� ��Ͽ� �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */
	public int registMember(MemberVO memberVO);
	
	
	/**
	 * ������� ������ ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @return ������� ������ �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */ 
	public int modifyMember(MemberVO memberVO, boolean isAdmin);
	
	/**
	 * �������-���� ������ ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @param �����ڱ��� ������Ʈ ����
	 * @return ������� ������ �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */
	public int updateMemberState(MemberVO memberVO);
	
	/**
	 * ������� ������ ���� �޼���
	 * @param empNo ������ ����� ���
	 * @return ������ �����ϸ� 1 ��ȯ, �����ϸ� 0 ��ȯ
	 */
	public int removeMember(String userId);
	
	
	/**
	 * ��������� �����ϴ��� Ȯ���ϴ� �޼���
	 * @param empNo üũ�� ����� ���
	 * @return ����� �����ϸ� true, ������ false ����
	 */
	public boolean checkMember(String userId);
	
	
	/**
	 * �ش� ����� �ش��ϴ� ��������� �������� ���� �޼���
	 * @param empNo ������ ���
	 * @return �ش� ����� ������ ���� empVO ��ü
	 */
	public MemberVO selectOne(String userId);
	
	
	/**
	 * ��������͸� �� ������ �޼���
	 * @param empvo
	 * @return List�� ��� ������ ���.
	 */
	public List<MemberVO> selectAll();

	
	/**
	 * ��ü�� ��� �̸��ϵ��� ��¿��� ���� �޼���
	 * @param empNo
	 * @return
	 */
	public String mailSelect (String empNo);

  
  /**
	 * �̸��ϰ� ����� ����ִ� ��ü�� ��й�ȣ�� ã�Ƽ� ��й�ȣ�� ��ȯ
	 * @param empVO
	 * @return empPw
	 */
	public String forgotPw(MemberVO memberVO);
}