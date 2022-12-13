package web.dto;

public class AdoptPro {
	private int aniNo;
	private String userid;
	private String aniCate;
	private String aniName;
	private int aniAge;
	private String aniGender;
	private String aniNeutral;
	private String aniContent;
	private int aniHit;
	
	public AdoptPro() {}

	public AdoptPro(int aniNo, String userid, String aniCate, String aniName, int aniAge, String aniGender,
			String aniNeutral, String aniContent, int aniHit) {
		super();
		this.aniNo = aniNo;
		this.userid = userid;
		this.aniCate = aniCate;
		this.aniName = aniName;
		this.aniAge = aniAge;
		this.aniGender = aniGender;
		this.aniNeutral = aniNeutral;
		this.aniContent = aniContent;
		this.aniHit = aniHit;
	}

	@Override
	public String toString() {
		return "AdoptPro [aniNo=" + aniNo + ", userid=" + userid + ", aniCate=" + aniCate + ", aniName=" + aniName
				+ ", aniAge=" + aniAge + ", aniGender=" + aniGender + ", aniNeutral=" + aniNeutral + ", aniContent="
				+ aniContent + ", aniHit=" + aniHit + "]";
	}

	public int getAniNo() {
		return aniNo;
	}

	public void setAniNo(int aniNo) {
		this.aniNo = aniNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAniCate() {
		return aniCate;
	}

	public void setAniCate(String aniCate) {
		this.aniCate = aniCate;
	}

	public String getAniName() {
		return aniName;
	}

	public void setAniName(String aniName) {
		this.aniName = aniName;
	}

	public int getAniAge() {
		return aniAge;
	}

	public void setAniAge(int aniAge) {
		this.aniAge = aniAge;
	}

	public String getAniGender() {
		return aniGender;
	}

	public void setAniGender(String aniGender) {
		this.aniGender = aniGender;
	}

	public String getAniNeutral() {
		return aniNeutral;
	}

	public void setAniNeutral(String aniNeutral) {
		this.aniNeutral = aniNeutral;
	}

	public String getAniContent() {
		return aniContent;
	}

	public void setAniContent(String aniContent) {
		this.aniContent = aniContent;
	}

	public int getAniHit() {
		return aniHit;
	}

	public void setAniHit(int aniHit) {
		this.aniHit = aniHit;
	}

}
