package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;


public interface IMemberService {

	/**
	 * 로그인 체크를 위한 메서드, 파라미터로 memberVO와 관리자로그인 체크 여부가 들어간다
	 * @param membervo, isMemberLogin
	 * @return 로그인 성공여부
	 */
	public boolean loginCheck(MemberVO memberVO, boolean isMemberLogin);

	/**
	 * 이메일과 사번이 들어있는 객체로 비밀번호를 찾아서 비밀번호를 반환
	 * @param memberVO
	 * @return usersPass
	 */
	public String forgotPass(MemberVO memberVO);
	
}