package kr.or.ddit.restaurant.vo;

public class RestaurantVO {
	 private String restBizno;
	 private String restName;
	 private String restMcls;
	 private String restScls;
	 private int addrNo;
	 private int addrPost;
	 private String addrBasic;
	 private String addrDetail;
	 private String addrLon;
	 private String addrLat;
	 private int addrLevel;
	 
	@Override
	public String toString() {
		return "RestaurantVO [restBizno=" + restBizno + ", restName=" + restName + ", restMcls=" + restMcls
				+ ", restScls=" + restScls + ", addrNo=" + addrNo + ", addrPost=" + addrPost + ", addrBasic="
				+ addrBasic + ", addrDetail=" + addrDetail + ", addrLon=" + addrLon + ", addrLat=" + addrLat
				+ ", addrLevel=" + addrLevel + "]";
	}

	public String getRestBizno() {
		return restBizno;
	}

	public void setRestBizno(String restBizno) {
		this.restBizno = restBizno;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getRestMcls() {
		return restMcls;
	}

	public void setRestMcls(String restMcls) {
		this.restMcls = restMcls;
	}

	public String getRestScls() {
		return restScls;
	}

	public void setRestScls(String restScls) {
		this.restScls = restScls;
	}

	public int getAddrNo() {
		return addrNo;
	}

	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
	}

	public int getAddrPost() {
		return addrPost;
	}

	public void setAddrPost(int addrPost) {
		this.addrPost = addrPost;
	}

	public String getAddrBasic() {
		return addrBasic;
	}

	public void setAddrBasic(String addrBasic) {
		this.addrBasic = addrBasic;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getAddrLon() {
		return addrLon;
	}

	public void setAddrLon(String addrLon) {
		this.addrLon = addrLon;
	}

	public String getAddrLat() {
		return addrLat;
	}

	public void setAddrLat(String addrLat) {
		this.addrLat = addrLat;
	}

	public int getAddrLevel() {
		return addrLevel;
	}

	public void setAddrLevel(int addrLevel) {
		this.addrLevel = addrLevel;
	}
	
	 
	 
	 
}
