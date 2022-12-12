package web.dto;

public class AdoptResrchFile {

	private int resrchfileNo;
	private int adoptNo;
	private String resrchfileOrigin;
	private String resrchfileStored;
	
	public AdoptResrchFile() {	}

	public AdoptResrchFile(int resrchfileNo, int adoptNo, String resrchfileOrigin, String resrchfileStored) {
		super();
		this.resrchfileNo = resrchfileNo;
		this.adoptNo = adoptNo;
		this.resrchfileOrigin = resrchfileOrigin;
		this.resrchfileStored = resrchfileStored;
	}

	@Override
	public String toString() {
		return "AdoptResrchFile [resrchfileNo=" + resrchfileNo + ", adoptNo=" + adoptNo + ", resrchfileOrigin="
				+ resrchfileOrigin + ", resrchfileStored=" + resrchfileStored + "]";
	}

	public int getResrchfileNo() {
		return resrchfileNo;
	}

	public void setResrchfileNo(int resrchfileNo) {
		this.resrchfileNo = resrchfileNo;
	}

	public int getAdoptNo() {
		return adoptNo;
	}

	public void setAdoptNo(int adoptNo) {
		this.adoptNo = adoptNo;
	}

	public String getResrchfileOrigin() {
		return resrchfileOrigin;
	}

	public void setResrchfileOrigin(String resrchfileOrigin) {
		this.resrchfileOrigin = resrchfileOrigin;
	}

	public String getResrchfileStored() {
		return resrchfileStored;
	}

	public void setResrchfileStored(String resrchfileStored) {
		this.resrchfileStored = resrchfileStored;
	}
	
}
