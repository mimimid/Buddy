package web.dto;

public class AdoptFile {
	private int anifileNo;
	private int aniNo;
	private String anifileOrigin;
	private String anifileStored;
	
	public AdoptFile() {}

	public AdoptFile(int anifileNo, int aniNo, String anifileOrigin, String anifileStored) {
		super();
		this.anifileNo = anifileNo;
		this.aniNo = aniNo;
		this.anifileOrigin = anifileOrigin;
		this.anifileStored = anifileStored;
	}

	@Override
	public String toString() {
		return "AdoptFile [anifileNo=" + anifileNo + ", aniNo=" + aniNo + ", anifileOrigin=" + anifileOrigin
				+ ", anifileStored=" + anifileStored + "]";
	}

	public int getAnifileNo() {
		return anifileNo;
	}

	public void setAnifileNo(int anifileNo) {
		this.anifileNo = anifileNo;
	}

	public int getAniNo() {
		return aniNo;
	}

	public void setAniNo(int aniNo) {
		this.aniNo = aniNo;
	}

	public String getAnifileOrigin() {
		return anifileOrigin;
	}

	public void setAnifileOrigin(String anifileOrigin) {
		this.anifileOrigin = anifileOrigin;
	}

	public String getAnifileStored() {
		return anifileStored;
	}

	public void setAnifileStored(String anifileStored) {
		this.anifileStored = anifileStored;
	}

}
