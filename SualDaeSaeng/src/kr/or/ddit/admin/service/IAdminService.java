package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.admin.vo.memberReqVO;

public interface IAdminService {

	public List<memberReqVO> selectmemList();

	public int AdminAccept(int usersNo);


}
