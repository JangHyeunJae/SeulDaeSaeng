
package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.vo.AddressVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.UsersVO;

public interface IMemberDao {
	

	public boolean loginCheck(MemberVO memberVO, boolean isMemberLogin);

	public String forgotPass(MemberVO memberVO);

	int memberIdChk(String usersId);

	public int usersJoin(UsersVO usersVo);

	public int addrJoin(AddressVO addrVo);

	public int memberJoin(MemberVO memberVo);

	public UsersVO selectUsers(String usersId);

	public MemberVO selectMember(int usersNo);

	public AddressVO selectAddr(int addrNo);

	public MemberVO getMemDetail(String usersId);

	public UsersVO getUsersDetail(String usersId);

}

