package web.dto;

public class Hospital {

	private int hospNo;
	private String hospName;
	private String hospTel;
	private String hospContent;
	private String hospWeekday;
	private String hospSat;
	private String hospSun;
	private String hospLunchhour;
	private int   hosp24;
	private double   hospRate;
	private int   hospReviewCnt;
	private int   hospLikeCnt;
	private String  hospMgtno;
	private String hospOldAddress;
	private String hospAddress;
	private String hospPostNo;
	private String  hospY;
	private String  hospX;
	private String  hospStateCode;
	private String hospStateNow;
	private int   adminno;
	private String adminid;
	
	private HospitalPic hospPic;
	
	public Hospital() {	}



	public Hospital(String hospMgtno,String hospName, String hospTel,  String hospOldAddress, String hospAddress,
			String hospPostNo, String hospX, String hospY, String hospStateCode, String hospStateNow) {
		super();
		this.hospName = hospName;
		this.hospTel = hospTel;
		this.hospMgtno = hospMgtno;
		this.hospOldAddress = hospOldAddress;
		this.hospAddress = hospAddress;
		this.hospPostNo = hospPostNo;
		this.hospY = hospY;
		this.hospX = hospX;
		this.hospStateCode = hospStateCode;
		this.hospStateNow = hospStateNow;
	}



	public Hospital(int hospNo, String hospName, String hospTel, String hospContent, String hospWeekday, String hospSat,
			String hospSun, String hospLunchhour, int hosp24, double hospRate, int hospReviewCnt, int hospLikeCnt,
			String hospMgtno, String hospOldAddress, String hospAddress, String hospPostNo, String hospY, String hospX,
			String hospStateCode, String hospStateNow, int adminno, String adminid, HospitalPic hospPic) {
		super();
		this.hospNo = hospNo;
		this.hospName = hospName;
		this.hospTel = hospTel;
		this.hospContent = hospContent;
		this.hospWeekday = hospWeekday;
		this.hospSat = hospSat;
		this.hospSun = hospSun;
		this.hospLunchhour = hospLunchhour;
		this.hosp24 = hosp24;
		this.hospRate = hospRate;
		this.hospReviewCnt = hospReviewCnt;
		this.hospLikeCnt = hospLikeCnt;
		this.hospMgtno = hospMgtno;
		this.hospOldAddress = hospOldAddress;
		this.hospAddress = hospAddress;
		this.hospPostNo = hospPostNo;
		this.hospY = hospY;
		this.hospX = hospX;
		this.hospStateCode = hospStateCode;
		this.hospStateNow = hospStateNow;
		this.adminno = adminno;
		this.adminid = adminid;
		this.hospPic = hospPic;
	}



	@Override
	public String toString() {
		return "Hospital [hospNo=" + hospNo + ", hospName=" + hospName + ", hospTel=" + hospTel + ", hospContent="
				+ hospContent + ", hospWeekday=" + hospWeekday + ", hospSat=" + hospSat + ", hospSun=" + hospSun
				+ ", hospLunchhour=" + hospLunchhour + ", hosp24=" + hosp24 + ", hospRate=" + hospRate
				+ ", hospReviewCnt=" + hospReviewCnt + ", hospLikeCnt=" + hospLikeCnt + ", hospMgtno=" + hospMgtno
				+ ", hospOldAddress=" + hospOldAddress + ", hospAddress=" + hospAddress + ", hospPostNo=" + hospPostNo
				+ ", hospY=" + hospY + ", hospX=" + hospX + ", hospStateCode=" + hospStateCode + ", hospStateNow="
				+ hospStateNow + ", adminno=" + adminno + ", adminid=" + adminid + ", hospPic=" + hospPic + "]";
	}



	public int getHospNo() {
		return hospNo;
	}



	public void setHospNo(int hospNo) {
		this.hospNo = hospNo;
	}



	public String getHospName() {
		return hospName;
	}



	public void setHospName(String hospName) {
		this.hospName = hospName;
	}



	public String getHospTel() {
		return hospTel;
	}



	public void setHospTel(String hospTel) {
		this.hospTel = hospTel;
	}



	public String getHospContent() {
		return hospContent;
	}



	public void setHospContent(String hospContent) {
		this.hospContent = hospContent;
	}



	public String getHospWeekday() {
		return hospWeekday;
	}



	public void setHospWeekday(String hospWeekday) {
		this.hospWeekday = hospWeekday;
	}



	public String getHospSat() {
		return hospSat;
	}



	public void setHospSat(String hospSat) {
		this.hospSat = hospSat;
	}



	public String getHospSun() {
		return hospSun;
	}



	public void setHospSun(String hospSun) {
		this.hospSun = hospSun;
	}



	public String getHospLunchhour() {
		return hospLunchhour;
	}



	public void setHospLunchhour(String hospLunchhour) {
		this.hospLunchhour = hospLunchhour;
	}



	public int getHosp24() {
		return hosp24;
	}



	public void setHosp24(int hosp24) {
		this.hosp24 = hosp24;
	}



	public double getHospRate() {
		return hospRate;
	}



	public void setHospRate(double hospRate) {
		this.hospRate = hospRate;
	}



	public int getHospReviewCnt() {
		return hospReviewCnt;
	}



	public void setHospReviewCnt(int hospReviewCnt) {
		this.hospReviewCnt = hospReviewCnt;
	}



	public int getHospLikeCnt() {
		return hospLikeCnt;
	}



	public void setHospLikeCnt(int hospLikeCnt) {
		this.hospLikeCnt = hospLikeCnt;
	}



	public String getHospMgtno() {
		return hospMgtno;
	}



	public void setHospMgtno(String hospMgtno) {
		this.hospMgtno = hospMgtno;
	}



	public String getHospOldAddress() {
		return hospOldAddress;
	}



	public void setHospOldAddress(String hospOldAddress) {
		this.hospOldAddress = hospOldAddress;
	}



	public String getHospAddress() {
		return hospAddress;
	}



	public void setHospAddress(String hospAddress) {
		this.hospAddress = hospAddress;
	}



	public String getHospPostNo() {
		return hospPostNo;
	}



	public void setHospPostNo(String hospPostNo) {
		this.hospPostNo = hospPostNo;
	}



	public String getHospY() {
		return hospY;
	}



	public void setHospY(String hospY) {
		this.hospY = hospY;
	}



	public String getHospX() {
		return hospX;
	}



	public void setHospX(String hospX) {
		this.hospX = hospX;
	}



	public String getHospStateCode() {
		return hospStateCode;
	}



	public void setHospStateCode(String hospStateCode) {
		this.hospStateCode = hospStateCode;
	}



	public String getHospStateNow() {
		return hospStateNow;
	}



	public void setHospStateNow(String hospStateNow) {
		this.hospStateNow = hospStateNow;
	}



	public int getAdminno() {
		return adminno;
	}



	public void setAdminno(int adminno) {
		this.adminno = adminno;
	}



	public String getAdminid() {
		return adminid;
	}



	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}



	public HospitalPic getHospPic() {
		return hospPic;
	}



	public void setHospPic(HospitalPic hospPic) {
		this.hospPic = hospPic;
	}
	
	
	



	


	
	
}