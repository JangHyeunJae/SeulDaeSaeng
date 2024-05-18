package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.admin.vo.MemberReqVO;

public interface IAdminService {

	public List<MemberReqVO> selectmemList();

	public int AdminAccept(int usersNo);

	public List<MemberReqVO> selectallList();   // 회원가입된 회원 전체조회 

	public MemberReqVO selectmember(String parameter);


}
