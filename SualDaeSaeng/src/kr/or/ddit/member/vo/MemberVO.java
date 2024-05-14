package kr.or.ddit.member.vo;

import java.time.LocalDate;

public class MemberVO {

	private int usersNo;
	private String memName;
	private String memNick;
	private String memBirth;
	private String memEmail;
	private String memTel;
	private String memClass;
	private LocalDate memRegdt;
	private int addrNo;
	
	
	public int getUsersNo() {
		return usersNo;
	}
	public void setUsersNo(int userNo) {
		this.usersNo = usersNo;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemClass() {
		return memClass;
	}
	public void setMemClass(String memClass) {
		this.memClass = memClass;
	}
	public LocalDate getMemRegdt() {
		return memRegdt;
	}
	public void setMemRegdt(LocalDate memRegdt) {
		this.memRegdt = memRegdt;
	}
	public int getAddrNo() {
		return addrNo;
	}
	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
	}



}
