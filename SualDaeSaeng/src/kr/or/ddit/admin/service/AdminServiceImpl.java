package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.admin.dao.AdminDaoImpl;
import kr.or.ddit.admin.dao.IAdmindao;
import kr.or.ddit.admin.vo.memberReqVO;

public class AdminServiceImpl implements IAdminService {
	
	private static AdminServiceImpl instance = null;
	private AdminServiceImpl() {}
	public static AdminServiceImpl getInstance() {
		if(instance == null) {
			instance = new AdminServiceImpl();
		}
		return instance;
	}

	private IAdmindao dao = AdminDaoImpl.getInstance();
	
	@Override
	public List<memberReqVO> selectmemList() {
		return dao.selectmemList();
	}

}
