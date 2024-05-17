package kr.or.ddit.admin.dao;

import java.util.List;

import kr.or.ddit.admin.vo.MemberReqVO;

public interface IAdmindao {

	public MemberReqVO selectmember(String parameter);

	public List<MemberReqVO> selectmemList();

	public int AdminAccept(int usersNo);

	public List<MemberReqVO> selectallList();


}
