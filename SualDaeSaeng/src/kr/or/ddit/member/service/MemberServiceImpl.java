package kr.or.ddit.member.service;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

import java.util.List;



public class MemberServiceImpl implements IMemberService{
	
	// �̱�������
	public static IMemberService instance = null;
	private MemberServiceImpl() {}
	public static IMemberService getInstance() {
		if(instance == null) instance = new MemberServiceImpl();
		return instance;
	}
	IMemberDao memberDao = MemberDaoImpl.getInstance();
	
	/**
	 * �α��� üũ�� ���� �޼���, �Ķ���ͷ� empVO�� �����ڷα��� üũ ���ΰ� ����
	 * @param empvo, isAdminLogin
	 * @return �α��� ��������
	 */
	@Override
	public boolean loginCheck(MemberVO memberVO, boolean isAdminLogin) {
		return memberDao.loginCheck(memberVO, isAdminLogin);
	}
		

   /**
	 * ������� ����� ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @return ��� ����� �����ϸ� 1�̻��� ���� ��ȯ�ǰ�, �����ϸ� 0�� ��ȯ��.
	 */
	@Override
	public int registMember(MemberVO memberVO) {
		return memberDao.joinEmployee(memberVO);
	}
	
	
	/**
	 * ������� ������ ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @return ������� ������ �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */
	@Override
	public int modifyMember(MemberVO memberVO, boolean isAdmin) {
		int cnt = memberDao.updateEmployee(memberVO, isAdmin);
		return cnt;
	}
	
	/**
	 * �������-���� ������ ���� �޼���
	 * @param empVO�� ����� �����Ͱ� ����� EmpVO�� ��ü
	 * @param �����ڱ��� ������Ʈ ����
	 * @return ������� ������ �����ϸ� 1�̻��� �� ��ȯ, �����ϸ� 0 ��ȯ
	 */
	@Override
	public int updateMemberState(MemberVO memberVO) {
		int cnt = memberDao.updateEmployeeState(memberVO);
		return cnt;
	}
	
	/**
	 * ������� ������ ���� �޼���
	 * @param empNo ������ ����� ���
	 * @return ������ �����ϸ� 1 ��ȯ, �����ϸ� 0 ��ȯ
	 */
	@Override
	public int removeMember(String userId) {
		return memberDao.deleteMember(userId);
	}
	
	
	/**
	 * ��������� �����ϴ��� Ȯ���ϴ� �޼���
	 * @param empNo üũ�� ����� ���
	 * @return ����� �����ϸ� true, ������ false ����
	 */
	@Override
	public boolean checkMember(String userId) {
		return memberDao.checkEmployee(userId);
	}
	
	
	/**
	 * �ش� ����� �ش��ϴ� ��������� �������� ���Ѹ޼���
	 * @param empNo ������ ���
	 * @return �ش� ����� ������ ���� empVO ��ü
	 */
	@Override
	public MemberVO selectOne(String userId) {
		return memberDao.selectOne(userId);
	}
	
	
	/**
	 * ��ü �������(����Ʈ)�� �������� �޼���
	 */
	@Override
	public List<MemberVO> selectAll() {
		List<MemberVO> memberList = memberDao.selectAll();
		return memberList;
	}
	
		
	/**
	 * �̸��ϰ� ����� ����ִ� ��ü�� ��й�ȣ�� ã�Ƽ� ��й�ȣ�� ��ȯ
	 * @param empVO
	 * @return empPw
	 */
	@Override
	public String forgotPw(MemberVO memberVO) {
		return memberDao.forgotPw(memberVO);
	}
	
	/**
	 * 	������� ���� ����� ���� �޼���
	 */
	@Override
	public String mailSelect(String userId) {
		return memberDao.mailSelect(userId);
	}
	
	
}