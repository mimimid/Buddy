package web.dto;

public class AniUserImg {
	
	private int profileno;
	private String profileorigin;
	private String profilestored;
	private int profilesize;
	private int userno;
	
	public AniUserImg() {}

	public AniUserImg(int profileno, String profileorigin, String profilestored, int profilesize, int userno) {
		super();
		this.profileno = profileno;
		this.profileorigin = profileorigin;
		this.profilestored = profilestored;
		this.profilesize = profilesize;
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "AniUserImg [profileno=" + profileno + ", profileorigin=" + profileorigin + ", profilestored="
				+ profilestored + ", profilesize=" + profilesize + ", userno=" + userno + "]";
	}

	public int getProfileno() {
		return profileno;
	}

	public void setProfileno(int profileno) {
		this.profileno = profileno;
	}

	public String getProfileorigin() {
		return profileorigin;
	}

	public void setProfileorigin(String profileorigin) {
		this.profileorigin = profileorigin;
	}

	public String getProfilestored() {
		return profilestored;
	}

	public void setProfilestored(String profilestored) {
		this.profilestored = profilestored;
	}

	public int getProfilesize() {
		return profilesize;
	}

	public void setProfilesize(int profilesize) {
		this.profilesize = profilesize;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	
	

}
