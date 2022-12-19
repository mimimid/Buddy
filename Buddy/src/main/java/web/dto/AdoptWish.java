package web.dto;

public class AdoptWish {
	private int aniNo;
	private int userno;
	
	public AdoptWish() {	}

	public AdoptWish(int aniNo, int userno) {
		super();
		this.aniNo = aniNo;
		this.userno = userno;
	}

	@Override
	public String toString() {
		return "AdoptWish [aniNo=" + aniNo + ", userno=" + userno + "]";
	}

	public int getAniNo() {
		return aniNo;
	}

	public void setAniNo(int aniNo) {
		this.aniNo = aniNo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

}
