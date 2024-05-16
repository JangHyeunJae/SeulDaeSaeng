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
	 * �α��� üũ�� ���� �޼���, �Ķ���ͷ� memberVO�� �����ڷα��� üũ ���ΰ� ����
	 * @param memberVO, isAdminLogin
	 * @return �α��� ��������
	 */
	@Override
	public boolean loginCheck(MemberVO memberVO, boolean isMemberLogin) {
		return memberDao.loginCheck(memberVO, isMemberLogin);
	}
	/**
	 * 이메일과 사번이 들어있는 객체로 비밀번호를 찾아서 비밀번호를 반환
	 * @param memberVO
	 * @return usersPass
	 */
	@Override
	public String forgotPass(MemberVO memberVO) {
		return memberDao.forgotPass(memberVO);
	}
}