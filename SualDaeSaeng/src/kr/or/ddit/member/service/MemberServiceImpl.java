package kr.or.ddit.member.service;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.AddressVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;



public class MemberServiceImpl implements IMemberService{
	
	private static IMemberService instance;
	private MemberServiceImpl() {}
	public static IMemberService getInstance() {
		if(instance == null) instance = new MemberServiceImpl();
		return instance;
	}
	IMemberDao memberDao = MemberDaoImpl.getInstance();
	

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
  
	@Override
	public int memberIdChk(String usersId) {
		return memberDao.memberIdChk(usersId);
	}
	@Override
	public int usersJoin(UsersVO usersVo) {
		return memberDao.usersJoin(usersVo);
	}
	@Override
	public int addrJoin(AddressVO addrVo) {
		return memberDao.addrJoin(addrVo);
	}
	@Override
	public int memberJoin(MemberVO memberVo) {
		return memberDao.memberJoin(memberVo);
	}
	@Override
	public UsersVO selectUsers(String usersId) {
		return memberDao.selectUsers(usersId);
	}
	@Override
	public MemberVO selectMember(int usersNo) {
		return memberDao.selectMember(usersNo);
	}
	@Override
	public AddressVO selectAddr(int addrNo) {
		return memberDao.selectAddr(addrNo);
	}
	@Override
	public MemberVO getMemDetail(String usersId) {
		return memberDao.getMemDetail(usersId);
	}
	@Override
	public UsersVO getUsersDetail(String usersId) {
		return memberDao.getUsersDetail(usersId);
	}
	@Override
	public String checkFindId(MemberVO memberVO) {
		return memberDao.checkFindId(memberVO);
	}
	@Override
	public String checkFindPw(MemberVO memberVO) {
		return memberDao.checkFindPw(memberVO);
	}
	@Override
	public String checking(String memName) {
		return memberDao.checking(memName);
	}
}

